import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  Rx<User?> firebaseUser = Rx<User?>(null);

  @override
  void onInit() {
    firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  User? get user => firebaseUser.value;

  Future<UserCredential?> signUpWithEmail(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      String message = "";
      switch (e.code) {
        case 'email-already-in-use':
          message = "The email address is already in use.";
          break;
        case 'invalid-email':
          message = "The email address is invalid.";
          break;
        case 'operation-not-allowed':
          message = "Email/password accounts are not enabled.";
          break;
        case 'weak-password':
          message = "The password is too weak.";
          break;
        default:
          message = e.message ?? "An unknown error occurred.";
      }
      Get.snackbar("Signup Error", message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Get.theme.colorScheme.errorContainer,
          colorText: Get.theme.colorScheme.onErrorContainer);
      return null;
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
      return null;
    }
  }

  Future<UserCredential?> loginWithEmail(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Login Error", e.message ?? "Login failed",
          snackPosition: SnackPosition.BOTTOM);
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
