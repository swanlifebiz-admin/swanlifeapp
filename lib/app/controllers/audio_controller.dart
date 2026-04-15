import 'dart:async';

import 'package:get/get.dart';

class AudioController extends GetxController {
  final RxBool isRecording = false.obs;
  final RxDouble wavePhase = 0.0.obs;

  Timer? _waveTimer;

  void toggleRecording() {
    isRecording.value = !isRecording.value;

    if (isRecording.value) {
      _startWave();
    } else {
      _stopWave();
      wavePhase.value = 0.0;
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
    super.onClose();
  }
}
