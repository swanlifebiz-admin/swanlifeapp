import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import '../data/repositories/journal_repository.dart';
import '../data/services/auth_service.dart';
import '../data/services/notification_service.dart';
import '../models/journal_entry_model.dart';

class JournalController extends GetxController {
  final JournalRepository _journalRepository = JournalRepository();
  final AuthService _authService = Get.find<AuthService>();
  final NotificationService _notificationService = NotificationService();

  final trueReflectionController = TextEditingController();
  final theAnswerController = TextEditingController();

  final Rx<File?> selectedVideo = Rx<File?>(null);
  final Rx<File?> selectedImage = Rx<File?>(null);
  final Rx<File?> selectedAudio = Rx<File?>(null);
  final isLoading = false.obs;

  // Audio recorder state
  late final AudioRecorder _audioRecorder;
  final isRecording = false.obs;
  final recordingSeconds = 0.obs;
  Timer? _recordingTimer;
  String? _tempAudioPath;

  @override
  void onInit() {
    super.onInit();
    _audioRecorder = AudioRecorder();
  }

  // ─── Video ───────────────────────────────────────────────────────────────

  Future<void> pickVideo() async {
    final ImagePicker picker = ImagePicker();
    final XFile? video = await picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      selectedVideo.value = File(video.path);
    }
  }

  void clearVideo() => selectedVideo.value = null;

  // ─── Image ───────────────────────────────────────────────────────────────

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }

  void clearImage() => selectedImage.value = null;

  // ─── Audio Recording ─────────────────────────────────────────────────────

  Future<void> startRecording() async {
    final hasPermission = await _audioRecorder.hasPermission();
    if (!hasPermission) {
      Get.snackbar(
        'Permission Denied',
        'Microphone access is required to record audio.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final dir = await getTemporaryDirectory();
    _tempAudioPath =
        '${dir.path}/audio_${DateTime.now().millisecondsSinceEpoch}.m4a';

    await _audioRecorder.start(
      const RecordConfig(encoder: AudioEncoder.aacLc, bitRate: 128000),
      path: _tempAudioPath!,
    );

    isRecording.value = true;
    recordingSeconds.value = 0;
    _recordingTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      recordingSeconds.value++;
    });
  }

  Future<void> stopRecording() async {
    _recordingTimer?.cancel();
    final path = await _audioRecorder.stop();
    isRecording.value = false;
    recordingSeconds.value = 0;

    if (path != null) {
      selectedAudio.value = File(path);
    }
  }

  Future<void> cancelRecording() async {
    _recordingTimer?.cancel();
    await _audioRecorder.cancel();
    isRecording.value = false;
    recordingSeconds.value = 0;
    _tempAudioPath = null;
  }

  void clearAudio() => selectedAudio.value = null;

  // ─── Save ─────────────────────────────────────────────────────────────────

  Future<void> saveReflection() async {
    final trueReflection = trueReflectionController.text.trim();
    final theAnswer = theAnswerController.text.trim();
    final hasVideo = selectedVideo.value != null;
    final hasImage = selectedImage.value != null;
    final hasAudio = selectedAudio.value != null;

    if (trueReflection.isEmpty &&
        theAnswer.isEmpty &&
        !hasVideo &&
        !hasImage &&
        !hasAudio) {
      Get.snackbar(
        'Missing Data',
        'Please provide a reflection or attach a file.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange.withValues(alpha: 0.1),
        colorText: Colors.orange[900],
      );
      return;
    }

    final user = _authService.user;
    if (user == null) {
      Get.snackbar('Error', 'You must be logged in to save a journal entry.');
      return;
    }

    isLoading.value = true;
    try {
      String? videoUrl;
      String? imageUrl;
      String? audioUrl;

      if (hasVideo) {
        videoUrl = await _journalRepository.uploadJournalAsset(
            user.uid, selectedVideo.value!.path, 'videos');
      }
      if (hasImage) {
        imageUrl = await _journalRepository.uploadJournalAsset(
            user.uid, selectedImage.value!.path, 'images');
      }
      if (hasAudio) {
        audioUrl = await _journalRepository.uploadJournalAsset(
            user.uid, selectedAudio.value!.path, 'audio');
      }

      final entry = JournalEntryModel(
        userId: user.uid,
        trueReflection: trueReflection,
        theAnswer: theAnswer,
        videoUrl: videoUrl,
        imageUrl: imageUrl,
        audioUrl: audioUrl,
        createdAt: DateTime.now(),
      );

      await _journalRepository.saveJournalEntry(entry);
      _resetForm();

      await _notificationService.createNotification(
        title: 'Journal Saved',
        body: 'Your reflection has been safely stored.',
        type: 'journal',
      );

      Get.snackbar(
        'Reflection Saved',
        'Your reflection has been safely stored.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withValues(alpha: 0.1),
        colorText: Colors.green[800],
      );
    } catch (e) {
      Get.snackbar(
        'Save Failed',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withValues(alpha: 0.1),
        colorText: Colors.red[800],
      );
    } finally {
      isLoading.value = false;
    }
  }

  void _resetForm() {
    trueReflectionController.clear();
    theAnswerController.clear();
    selectedVideo.value = null;
    selectedImage.value = null;
    selectedAudio.value = null;
  }

  @override
  void onClose() {
    _recordingTimer?.cancel();
    _audioRecorder.dispose();
    trueReflectionController.dispose();
    theAnswerController.dispose();
    super.onClose();
  }
}

