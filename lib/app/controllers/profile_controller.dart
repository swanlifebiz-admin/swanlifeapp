import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swanlife/app/models/feed_item_model.dart';
import 'package:swanlife/app/models/profile_model.dart';

class ProfileController extends GetxController {
  final Rx<ProfileModel> profile = ProfileModel.dummy().obs;

  final RxString intentionalPresenceText = ''.obs;
  final RxString wealthMindsetText = ''.obs;
  final RxString boundarySettingText = ''.obs;
  final RxString swanSharesText = ''.obs;

  final RxList<FeedItemModel> feedItems = <FeedItemModel>[
    const FeedItemModel(
      imageUrl:
          'https://images.unsplash.com/photo-1504198322253-cfa87a0ff25f?auto=format&fit=crop&w=1200&q=80',
      category: 'RITUAL',
      title: 'Morning Stillness',
      subtitle: 'A 7-minute grounding flow',
    ),
    const FeedItemModel(
      imageUrl:
          'https://images.unsplash.com/photo-1470246973918-29a93221c455?auto=format&fit=crop&w=1200&q=80',
      category: 'MINDSET',
      title: 'Soft Power Notes',
      subtitle: 'Reframe your weekly narrative',
    ),
    const FeedItemModel(
      imageUrl:
          'https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=crop&w=1200&q=80',
      category: 'COMMUNITY',
      title: 'Pond Reflections',
      subtitle: 'Highlights from your circle',
    ),
  ].obs;

  late final TextEditingController intentionalPresenceController;
  late final TextEditingController wealthMindsetController;
  late final TextEditingController boundarySettingController;
  late final TextEditingController swanSharesController;

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
    });
    wealthMindsetController.addListener(() {
      wealthMindsetText.value = wealthMindsetController.text;
    });
    boundarySettingController.addListener(() {
      boundarySettingText.value = boundarySettingController.text;
    });
    swanSharesController.addListener(() {
      swanSharesText.value = swanSharesController.text;
    });
  }

  @override
  void onClose() {
    intentionalPresenceController.dispose();
    wealthMindsetController.dispose();
    boundarySettingController.dispose();
    swanSharesController.dispose();
    super.onClose();
  }
}