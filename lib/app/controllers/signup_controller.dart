import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/services/auth_service.dart';
import '../data/repositories/user_repository.dart';
import '../models/user_model.dart';
import '../routes/app_routes.dart';

class SignupController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();
  final UserRepository _userRepository = Get.find<UserRepository>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  final obscurePassword = true.obs;
  final acceptTerms = false.obs;
  final isLoading = false.obs;

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  Future<void> signup() async {
    if (!_validate()) return;

    isLoading.value = true;
    try {
      final credential = await _authService.signUpWithEmail(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (credential != null && credential.user != null) {
        // Create user in Firestore
        final newUser = UserModel(
          uid: credential.user!.uid,
          email: emailController.text.trim(),
          name: nameController.text.trim(),
          createdAt: DateTime.now(),
        );
        
        await _userRepository.createUser(newUser);
        
        Get.snackbar(
          "Success", 
          "Account created successfully!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green[800]
        );
        Get.offAllNamed(Routes.HOME);
      }
    } catch (e) {
      Get.snackbar(
        "Error", 
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red[800]
      );
    } finally {
      isLoading.value = false;
    }
  }

  bool _validate() {
    if (nameController.text.isEmpty) {
      _showError("Please enter your full name");
      return false;
    }
    if (emailController.text.isEmpty || !GetUtils.isEmail(emailController.text.trim())) {
      _showError("Please enter a valid email address");
      return false;
    }
    if (passwordController.text.isEmpty) {
      _showError("Please enter a password");
      return false;
    }
    if (passwordController.text.length < 6) {
      _showError("Password must be at least 6 characters");
      return false;
    }
    if (!acceptTerms.value) {
      _showError("You must accept the terms and conditions");
      return false;
    }
    return true;
  }

  void _showError(String message) {
    Get.snackbar(
      "Validation Error", 
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.orange.withOpacity(0.1),
      colorText: Colors.orange[900]
    );
  }

  void goToLogin() {
    Get.back();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
