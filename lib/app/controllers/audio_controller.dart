import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';

class AudioController extends GetxController {
  final RxBool isRecording = false.obs;
  final RxDouble wavePhase = 0.0.obs;
  final RxList<AudioRecording> recordings = <AudioRecording>[].obs;
  final RxBool isLoading = false.obs;
  final RxString currentlyPlayingId = ''.obs;
  final RxBool isPlaying = false.obs;

  Timer? _waveTimer;
  final AudioRecorder _audioRecorder = AudioRecorder();
  final AudioPlayer _audioPlayer = AudioPlayer();
  String? _currentRecordingPath;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    _loadRecordings();
    _audioPlayer.onPlayerComplete.listen((_) {
      isPlaying.value = false;
      currentlyPlayingId.value = '';
    });
  }

  Future<void> toggleRecording() async {
    if (isRecording.value) {
      await _stopRecording();
    } else {
      await _startRecording();
    }
  }

  Future<void> _startRecording() async {
    try {
      final status = await Permission.microphone.request();
      if (!status.isGranted) {
        Get.snackbar('Permission Denied', 'Microphone permission is required');
        return;
      }

      final directory = await getTemporaryDirectory();
      _currentRecordingPath =
          '${directory.path}/recording_${DateTime.now().millisecondsSinceEpoch}.m4a';

      await _audioRecorder.start(
        const RecordConfig(
          encoder: AudioEncoder.aacLc,
          bitRate: 128000,
          sampleRate: 44100,
        ),
        path: _currentRecordingPath!,
      );

      isRecording.value = true;
      _startWave();
    } catch (e) {
      Get.snackbar('Error', 'Failed to start recording: $e');
    }
  }

  Future<void> _stopRecording() async {
    try {
      final path = await _audioRecorder.stop();
      _stopWave();
      isRecording.value = false;
      wavePhase.value = 0.0;

      if (path != null) {
        await _showTitleDialog(path);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to stop recording: $e');
      isRecording.value = false;
      _stopWave();
    }
  }

  Future<void> _showTitleDialog(String path) async {
    final TextEditingController titleController = TextEditingController();
    
    await Get.dialog(
      AlertDialog(
        title: const Text('Name Your Recording'),
        content: TextField(
          controller: titleController,
          decoration: const InputDecoration(
            hintText: 'Enter recording name',
            border: OutlineInputBorder(),
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (titleController.text.trim().isNotEmpty) {
                Get.back(result: titleController.text.trim());
              } else {
                Get.back(result: null);
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );

    final title = titleController.text.trim();
    if (title.isNotEmpty) {
      await _saveRecordingToFirebase(path, title);
    }
  }

  Future<void> _saveRecordingToFirebase(String localPath, String title) async {
    try {
      isLoading.value = true;

      final user = _auth.currentUser;
      if (user == null) {
        Get.snackbar('Error', 'User not authenticated');
        return;
      }

      final file = File(localPath);
      final fileName = 'audio_${DateTime.now().millisecondsSinceEpoch}.m4a';
      final ref = _storage.ref().child('audio/${user.uid}/$fileName');

      await ref.putFile(file);
      final downloadUrl = await ref.getDownloadURL();

      final recording = AudioRecording(
        id: '',
        title: title,
        url: downloadUrl,
        createdAt: DateTime.now(),
        duration: await _getAudioDuration(file),
      );

      final docRef = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('recordings')
          .add(recording.toMap());

      recording.id = docRef.id;
      recordings.insert(0, recording);

      Get.snackbar('Success', 'Recording saved successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to save recording: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<Duration> _getAudioDuration(File file) async {
    return const Duration(seconds: 0);
  }

  Future<void> _loadRecordings() async {
    try {
      final user = _auth.currentUser;
      if (user == null) return;

      final snapshot = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('recordings')
          .orderBy('createdAt', descending: true)
          .get();

      recordings.value = snapshot.docs.map((doc) {
        final data = doc.data();
        return AudioRecording(
          id: doc.id,
          title: data['title'] ?? 'Untitled',
          url: data['url'] ?? '',
          createdAt: (data['createdAt'] as Timestamp).toDate(),
          duration: Duration(seconds: data['duration'] ?? 0),
        );
      }).toList();
    } catch (e) {
      print('Error loading recordings: $e');
    }
  }

  Future<void> playAudio(String recordingId, String url) async {
    try {
      if (currentlyPlayingId.value == recordingId && isPlaying.value) {
        await _audioPlayer.pause();
        isPlaying.value = false;
      } else if (currentlyPlayingId.value == recordingId && !isPlaying.value) {
        await _audioPlayer.resume();
        isPlaying.value = true;
      } else {
        await _audioPlayer.play(UrlSource(url));
        currentlyPlayingId.value = recordingId;
        isPlaying.value = true;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to play audio: $e');
    }
  }

  Future<void> stopAudio() async {
    try {
      await _audioPlayer.stop();
      isPlaying.value = false;
      currentlyPlayingId.value = '';
    } catch (e) {
      print('Error stopping audio: $e');
    }
  }

  void _startWave() {
    _waveTimer?.cancel();
    _waveTimer = Timer.periodic(const Duration(milliseconds: 16), (_) {
      wavePhase.value = (wavePhase.value + 0.02) % 1.0;
    });
  }

  void _stopWave() {
    _waveTimer?.cancel();
    _waveTimer = null;
  }

  @override
  void onClose() {
    _stopWave();
    _audioRecorder.dispose();
    super.onClose();
  }
}

class AudioRecording {
  String id;
  final String title;
  final String url;
  final DateTime createdAt;
  final Duration duration;

  AudioRecording({
    required this.id,
    required this.title,
    required this.url,
    required this.createdAt,
    required this.duration,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'url': url,
      'createdAt': Timestamp.fromDate(createdAt),
      'duration': duration.inSeconds,
    };
  }
}
