import 'package:get/get.dart';
import 'package:swanlife/app/controllers/profile_controller.dart';

class HomeController extends GetxController {
  final ProfileController _profileController = Get.find<ProfileController>();

  String get avatarImageUrl => _profileController.avatarImageUrl;

  void onOpenJournal() {
    // TODO: Navigate to journal
  }

  void onShopLetsGo() {
    // TODO: Navigate to shop
  }

  void onLifestyleStart() {
    // TODO: Navigate to lifestyle
  }
}

