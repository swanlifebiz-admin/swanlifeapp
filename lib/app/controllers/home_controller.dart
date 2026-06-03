import 'dart:async';
import 'package:get/get.dart';
import 'package:swanlife/app/controllers/profile_controller.dart';
import 'package:swanlife/app/data/services/notification_service.dart';
import 'package:swanlife/app/data/services/auth_service.dart';
import 'package:swanlife/app/data/repositories/journal_repository.dart';
import 'package:swanlife/app/routes/app_routes.dart';
import 'package:swanlife/core/utils/url_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  final ProfileController _profileController = Get.find<ProfileController>();
  final NotificationService _notificationService = NotificationService();
  final AuthService _authService = Get.find<AuthService>();
  final JournalRepository _journalRepository = JournalRepository();

  String get avatarImageUrl => _profileController.avatarImageUrl;
  final RxInt unreadCount = 0.obs;
  final RxnString latestJournalText = RxnString();
  StreamSubscription? _notificationSubscription;

  @override
  void onInit() {
    super.onInit();
    _loadUnreadCount();
    _loadLatestJournal();
    _listenToNotifications();
  }

  @override
  void onReady() {
    super.onReady();
    _loadUnreadCount();
    _loadLatestJournal();
  }

  Future<void> _loadLatestJournal() async {
    final user = _authService.user;
    if (user == null) return;
    final latestJournal = await _journalRepository.getLatestTextJournal(user.uid);
    if (latestJournal != null) {
      final text = latestJournal.trueReflection.trim().isNotEmpty
          ? latestJournal.trueReflection
          : latestJournal.theAnswer;
      latestJournalText.value = text.trim().isNotEmpty ? text : null;
    } else {
      latestJournalText.value = null;
    }
  }

  Future<void> _loadUnreadCount() async {
    unreadCount.value = await _notificationService.getUnreadCount();
  }

  void _listenToNotifications() {
    _notificationSubscription = _notificationService
        .getNotificationsStream()
        .listen(
          (_) async {
            unreadCount.value = await _notificationService.getUnreadCount();
          },
          onError: (error) {
            print('Notification stream error: $error');
          },
        );
  }

  void onOpenJournal() {
    Get.toNamed(Routes.JOURNAL)?.then((_) {
      _loadLatestJournal();
    });
  }

  void onShopLetsGo() {
    Get.toNamed(Routes.AUDIO_JOURNAL);
  }

  void onLifestyleStart() {
    UrlHelper.launchURL(
      'https://share.google/pWO6XHaG0tQ50Ep30',
      mode: LaunchMode.platformDefault,
    );
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
