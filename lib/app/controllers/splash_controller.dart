import 'package:get/get.dart';
import '../data/services/auth_service.dart';
import '../routes/app_routes.dart';

class SplashController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  @override
  void onInit() {
    super.onInit();
    _handleNavigation();
  }

  void _handleNavigation() async {
    await Future.delayed(const Duration(seconds: 3));
    
    if (_authService.user != null) {
      // User is logged in, go to home
      Get.offAllNamed(Routes.HOME);
    } else {
      // User is not logged in, go to login
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
