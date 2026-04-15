import 'package:get/get.dart';
import '../controllers/main_shell_controller.dart';
import '../controllers/home_controller.dart';
import '../controllers/audio_controller.dart';
import '../controllers/profile_controller.dart';

class MainShellBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainShellController());
    Get.put(ProfileController());
    Get.put(HomeController());
    Get.put(AudioController());
  }
}
