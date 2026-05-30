import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/services/auth_service.dart';
import '../routes/app_routes.dart';

class LoginController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  final obscurePassword = true.obs;
  final isLoading = false.obs;

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  Future<void> login() async {
    if (!_validate()) return;

    isLoading.value = true;
    try {
      final credential = await _authService.loginWithEmail(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (credential != null && credential.user != null) {
        Get.snackbar(
          "Welcome Back", 
          "Logged in successfully!",
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
    if (emailController.text.isEmpty || !GetUtils.isEmail(emailController.text.trim())) {
      _showError("Please enter a valid email address");
      return false;
    }
    if (passwordController.text.isEmpty) {
      _showError("Please enter your password");
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

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
