import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swanlife/app/data/repositories/journal_repository.dart';
import 'package:swanlife/app/data/repositories/user_repository.dart';
import 'package:swanlife/app/data/services/auth_service.dart';
import 'package:swanlife/app/models/feed_item_model.dart';
import 'package:swanlife/app/models/profile_model.dart';
import 'package:swanlife/app/models/user_model.dart';

class ProfileController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();
  final UserRepository _userRepository = Get.find<UserRepository>();
  final JournalRepository _journalRepository = JournalRepository();

  final Rx<ProfileModel> profile = ProfileModel.dummy().obs;

  final RxString intentionalPresenceText = ''.obs;
  final RxString wealthMindsetText = ''.obs;
  final RxString boundarySettingText = ''.obs;
  final RxString swanSharesText = ''.obs;
  final RxString saveStatus = ''.obs;

  Future<void> updateProfilePicture() async {
    final picker = ImagePicker();
    final file = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
      maxWidth: 500,
      maxHeight: 500,
    );
    if (file == null) return;

    final firebaseUser = _authService.user;
    if (firebaseUser == null || _cachedUser == null) return;

    saveStatus.value = 'Saving...';
    try {
      final url = await _journalRepository.uploadJournalAsset(
        firebaseUser.uid,
        file.path,
        'profile',
      );

      final updatedUser = UserModel(
        uid: _cachedUser!.uid,
        email: _cachedUser!.email,
        name: _cachedUser!.name,
        profilePic: url,
        createdAt: _cachedUser!.createdAt,
        rankSubtitle: _cachedUser!.rankSubtitle,
        visionQuote: _cachedUser!.visionQuote,
        pondDescription: _cachedUser!.pondDescription,
        evolutionProgress: _cachedUser!.evolutionProgress,
        intentionalPresence: _cachedUser!.intentionalPresence,
        wealthMindset: _cachedUser!.wealthMindset,
        boundarySetting: _cachedUser!.boundarySetting,
        swanShares: _cachedUser!.swanShares,
      );

      _cachedUser = updatedUser;
      await _userRepository.updateUser(updatedUser);

      // Rebuild the ProfileModel with new image url
      final current = profile.value;
      profile.value = ProfileModel(
        avatarImageUrl: url,
        name: current.name,
        rankSubtitle: current.rankSubtitle,
        daysActive: current.daysActive,
        reflections: current.reflections,
        visionQuote: current.visionQuote,
        pondDescription: current.pondDescription,
        textEntries: current.textEntries,
        videoEntries: current.videoEntries,
        mediaEntries: current.mediaEntries,
      );

      saveStatus.value = 'Saved';
      Timer(const Duration(seconds: 2), () {
        if (saveStatus.value == 'Saved') {
          saveStatus.value = '';
        }
      });
    } catch (e) {
      saveStatus.value = 'Error';
      debugPrint("Error updating profile picture: $e");
    }
  }


  final RxList<FeedItemModel> feedItems = <FeedItemModel>[
    const FeedItemModel(
      imageUrl:
          'https://images.unsplash.com/photo-1504198322253-cfa87a0ff25f?auto=format&fit=crop&w=1200&q=80',
      category: 'TIKTOK',
      title: 'Morning Stillness',
      subtitle: 'A 7-minute grounding flow',
      videoUrl: 'https://www.tiktok.com/@swanlife',
    ),
    const FeedItemModel(
      imageUrl:
          'https://images.unsplash.com/photo-1470246973918-29a93221c455?auto=format&fit=crop&w=1200&q=80',
      category: 'TIKTOK',
      title: 'Soft Power Notes',
      subtitle: 'Reframe your weekly narrative',

      videoUrl: 'https://www.tiktok.com/@swanlife',
    ),
    const FeedItemModel(
      imageUrl:
          'https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=crop&w=1200&q=80',
      category: 'TIKTOK',
      title: 'Pond Reflections',
      subtitle: 'Highlights from your circle',
      videoUrl: 'https://www.tiktok.com/@swanlife',
    ),
  ].obs;

  late final TextEditingController intentionalPresenceController;
  late final TextEditingController wealthMindsetController;
  late final TextEditingController boundarySettingController;
  late final TextEditingController swanSharesController;

  UserModel? _cachedUser;
  bool _isUpdatingControllers = false;

  Timer? _presenceTimer;
  Timer? _wealthTimer;
  Timer? _boundaryTimer;
  Timer? _sharesTimer;

  String get avatarImageUrl => profile.value.avatarImageUrl;

  @override
  void onInit() {
    super.onInit();
    intentionalPresenceController = TextEditingController();
    wealthMindsetController = TextEditingController();
    boundarySettingController = TextEditingController();
    swanSharesController = TextEditingController();

    intentionalPresenceController.addListener(() {
      intentionalPresenceText.value = intentionalPresenceController.text;
      if (!_isUpdatingControllers) {
        saveStatus.value = 'Saving...';
      }
      _presenceTimer?.cancel();
      _presenceTimer = Timer(const Duration(milliseconds: 1000), () {
        _saveField('intentionalPresence', intentionalPresenceController.text);
      });
    });
    wealthMindsetController.addListener(() {
      wealthMindsetText.value = wealthMindsetController.text;
      if (!_isUpdatingControllers) {
        saveStatus.value = 'Saving...';
      }
      _wealthTimer?.cancel();
      _wealthTimer = Timer(const Duration(milliseconds: 1000), () {
        _saveField('wealthMindset', wealthMindsetController.text);
      });
    });
    boundarySettingController.addListener(() {
      boundarySettingText.value = boundarySettingController.text;
      if (!_isUpdatingControllers) {
        saveStatus.value = 'Saving...';
      }
      _boundaryTimer?.cancel();
      _boundaryTimer = Timer(const Duration(milliseconds: 1000), () {
        _saveField('boundarySetting', boundarySettingController.text);
      });
    });
    swanSharesController.addListener(() {
      swanSharesText.value = swanSharesController.text;
      if (!_isUpdatingControllers) {
        saveStatus.value = 'Saving...';
      }
      _sharesTimer?.cancel();
      _sharesTimer = Timer(const Duration(milliseconds: 1000), () {
        _saveField('swanShares', swanSharesController.text);
      });
    });

    loadUserData();
  }

  Future<void> loadUserData() async {
    final firebaseUser = _authService.user;
    if (firebaseUser == null) return;

    try {
      final userDoc = await _userRepository.getUser(firebaseUser.uid);
      if (userDoc != null) {
        _cachedUser = userDoc;

        final days = userDoc.createdAt != null
            ? DateTime.now().difference(userDoc.createdAt!).inDays + 1
            : 1;

        final reflectionCount = await _journalRepository.getReflectionCount(
          firebaseUser.uid,
        );

        final stats = await _journalRepository.getActivityStats(firebaseUser.uid);

        profile.value = ProfileModel(
          avatarImageUrl:
              userDoc.profilePic ??
              'https://resize.allw.mn/filters:format(webp)/filters:quality(70)/800x800/thumbs/76/ufvak7bk60gmpnq5e3c3t_1080x1350.jpg',
          name: userDoc.name ?? firebaseUser.email?.split('@').first ?? 'User',
          rankSubtitle: userDoc.rankSubtitle ?? 'THE ETHEREAL PATH x TIER I',
          daysActive: days,
          reflections: reflectionCount,
          visionQuote:
              userDoc.visionQuote ??
              '"To live with the grace of a swan-serene above the surface, while navigating the depths with purpose and silent strength."',
          pondDescription:
              userDoc.pondDescription ??
              'Your ripple in the pond is expanding. Keep sharing your reflections and hold steady in your next step.',
          textEntries: stats.textCount,
          videoEntries: stats.videoCount,
          mediaEntries: stats.mediaCount,
        );

        _isUpdatingControllers = true;
        intentionalPresenceController.text = userDoc.intentionalPresence ?? '';
        wealthMindsetController.text = userDoc.wealthMindset ?? '';
        boundarySettingController.text = userDoc.boundarySetting ?? '';
        swanSharesController.text = userDoc.swanShares ?? '';
        _isUpdatingControllers = false;
      }
    } catch (e) {
      debugPrint("Error loading user profile: $e");
    }
  }

  void _saveField(String field, String value) async {
    if (_isUpdatingControllers) return;
    final firebaseUser = _authService.user;
    if (firebaseUser == null || _cachedUser == null) return;

    try {
      final updatedUser = UserModel(
        uid: _cachedUser!.uid,
        email: _cachedUser!.email,
        name: _cachedUser!.name,
        profilePic: _cachedUser!.profilePic,
        createdAt: _cachedUser!.createdAt,
        rankSubtitle: _cachedUser!.rankSubtitle,
        visionQuote: _cachedUser!.visionQuote,
        pondDescription: _cachedUser!.pondDescription,
        evolutionProgress: _cachedUser!.evolutionProgress,
        intentionalPresence: field == 'intentionalPresence'
            ? value
            : _cachedUser!.intentionalPresence,
        wealthMindset: field == 'wealthMindset'
            ? value
            : _cachedUser!.wealthMindset,
        boundarySetting: field == 'boundarySetting'
            ? value
            : _cachedUser!.boundarySetting,
        swanShares: field == 'swanShares' ? value : _cachedUser!.swanShares,
      );

      _cachedUser = updatedUser;
      await _userRepository.updateUser(updatedUser);
      saveStatus.value = 'Saved';
      Timer(const Duration(seconds: 2), () {
        if (saveStatus.value == 'Saved') {
          saveStatus.value = '';
        }
      });
    } catch (e) {
      saveStatus.value = 'Error';
      debugPrint("Error updating profile field $field: $e");
    }
  }

  @override
  void onClose() {
    _presenceTimer?.cancel();
    _wealthTimer?.cancel();
    _boundaryTimer?.cancel();
    _sharesTimer?.cancel();
    intentionalPresenceController.dispose();
    wealthMindsetController.dispose();
    boundarySettingController.dispose();
    swanSharesController.dispose();
    super.onClose();
  }
}
