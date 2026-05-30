import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/controllers/journal_controller.dart';
import 'package:swanlife/app/ui/theme/app_colors.dart';

class JournalAudioRecorderSheet extends StatefulWidget {
  const JournalAudioRecorderSheet({super.key});

  @override
  State<JournalAudioRecorderSheet> createState() =>
      _JournalAudioRecorderSheetState();
}

class _JournalAudioRecorderSheetState
    extends State<JournalAudioRecorderSheet>
    with SingleTickerProviderStateMixin {
  final JournalController _ctrl = Get.find<JournalController>();
  late AnimationController _pulseCtrl;
  late Animation<double> _pulseAnim;

  @override
  void initState() {
    super.initState();
    _pulseCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);
    _pulseAnim = Tween<double>(begin: 1.0, end: 1.25).animate(
      CurvedAnimation(parent: _pulseCtrl, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseCtrl.dispose();
    super.dispose();
  }

  String _formatTime(int seconds) {
    final m = (seconds ~/ 60).toString().padLeft(2, '0');
    final s = (seconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 40.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          Container(
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: AppColors.textSecondary.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          SizedBox(height: 24.h),

          // Title
          Text(
            'Record Audio Note',
            style: GoogleFonts.playfairDisplay(
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.loginTextDark,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            'Speak your truth — your voice is your record.',
            style: GoogleFonts.manrope(
              fontSize: 13.sp,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: 36.h),

          // Waveform / pulse visual
          Obx(() {
            final recording = _ctrl.isRecording.value;
            return AnimatedBuilder(
              animation: _pulseAnim,
              builder: (_, __) {
                final scale = recording ? _pulseAnim.value : 1.0;
                return Transform.scale(
                  scale: scale,
                  child: Container(
                    width: 100.w,
                    height: 100.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: recording
                          ? AppColors.error.withValues(alpha: 0.12)
                          : AppColors.primary.withValues(alpha: 0.1),
                      border: Border.all(
                        color: recording ? AppColors.error : AppColors.primary,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      recording ? Icons.mic_rounded : Icons.mic_none_rounded,
                      size: 44.sp,
                      color: recording ? AppColors.error : AppColors.primary,
                    ),
                  ),
                );
              },
            );
          }),

          SizedBox(height: 20.h),

          // Timer
          Obx(() {
            final secs = _ctrl.recordingSeconds.value;
            final recording = _ctrl.isRecording.value;
            return Text(
              recording ? _formatTime(secs) : '00:00',
              style: GoogleFonts.manrope(
                fontSize: 28.sp,
                fontWeight: FontWeight.w700,
                color: _ctrl.isRecording.value
                    ? AppColors.error
                    : AppColors.textSecondary,
                letterSpacing: 2,
              ),
            );
          }),

          SizedBox(height: 36.h),

          // Action buttons
          Obx(() {
            final recording = _ctrl.isRecording.value;
            if (!recording) {
              return _buildStartButton();
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCancelButton(),
                  _buildStopAndAttachButton(),
                ],
              );
            }
          }),
        ],
      ),
    );
  }

  Widget _buildStartButton() {
    return GestureDetector(
      onTap: _ctrl.startRecording,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(14.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.35),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.mic_rounded, color: Colors.white, size: 20.sp),
            SizedBox(width: 8.w),
            Text(
              'Start Recording',
              style: GoogleFonts.manrope(
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCancelButton() {
    return GestureDetector(
      onTap: () async {
        await _ctrl.cancelRecording();
        Get.back();
      },
      child: Container(
        width: 130.w,
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: AppColors.error.withValues(alpha: 0.5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.close, color: AppColors.error, size: 18.sp),
            SizedBox(width: 6.w),
            Text(
              'Discard',
              style: GoogleFonts.manrope(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.error,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStopAndAttachButton() {
    return GestureDetector(
      onTap: () async {
        await _ctrl.stopRecording();
        Get.back();
      },
      child: Container(
        width: 170.w,
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(14.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.3),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline, color: Colors.white, size: 18.sp),
            SizedBox(width: 6.w),
            Text(
              'Stop & Attach',
              style: GoogleFonts.manrope(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
