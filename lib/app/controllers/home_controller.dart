import 'dart:async';
import 'package:get/get.dart';
import 'package:swanlife/app/controllers/profile_controller.dart';
import 'package:swanlife/app/data/services/notification_service.dart';

class HomeController extends GetxController {
  final ProfileController _profileController = Get.find<ProfileController>();
  final NotificationService _notificationService = NotificationService();

  String get avatarImageUrl => _profileController.avatarImageUrl;
  final RxInt unreadCount = 0.obs;
  StreamSubscription? _notificationSubscription;

  @override
  void onInit() {
    super.onInit();
    _loadUnreadCount();
    _listenToNotifications();
  }

  @override
  void onReady() {
    super.onReady();
    _loadUnreadCount();
  }

  Future<void> _loadUnreadCount() async {
    unreadCount.value = await _notificationService.getUnreadCount();
  }

  void _listenToNotifications() {
    _notificationSubscription = _notificationService
        .getNotificationsStream()
        .listen((_) async {
      unreadCount.value = await _notificationService.getUnreadCount();
    }, onError: (error) {
      print('Notification stream error: $error');
    });
  }

  void onOpenJournal() {
    // TODO: Navigate to journal
  }

  void onShopLetsGo() {
    // TODO: Navigate to shop
  }

  void onLifestyleStart() {
    // TODO: Navigate to lifestyle
  }

  void onNotificationsTap() {
    Get.toNamed('/notifications')?.then((_) {
      _loadUnreadCount();
    });
  }

  @override
  void onClose() {
    _notificationSubscription?.cancel();
    super.onClose();
  }
}

