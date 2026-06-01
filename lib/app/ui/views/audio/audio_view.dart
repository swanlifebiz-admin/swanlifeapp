import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/controllers/audio_controller.dart';
import 'package:swanlife/app/routes/app_routes.dart';
import 'package:swanlife/app/ui/theme/app_colors.dart';
import 'package:swanlife/app/ui/views/audio/components/wave_form_pointer.dart';

class AudioView extends GetView<AudioController> {
  const AudioView({super.key});

  static const List<double> _barHeights = [
    15,
    30,
    45,
    70,
    33,
    95,
    50,
    75,
    35,
    65,
    15,
  ];

  static const List<Color> _barColors = [
    Color(0xFFAAAAAA),
    Color(0xFF666666),
    Color(0xFFAAAAAA),
    Color(0xFF666666),
    Color(0xFF666666),
    Color(0xFF000000),
    Color(0xFF000000),
    Color(0xFF333333),
    Color(0xFFAAAAAA),
    Color(0xFF6E6E6E),
    Color(0xFF000000),
  ];

  static const double _maxBarHeight = 80;
  static const double _barWidth = 4;
  static const double _barSpacing = 5;
  static const double _barRadius = 4;
  static const double _amplitude = 8;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final titleTextColor = isDark ? Colors.white : AppColors.loginTextDark;
    final bodyTextColor = isDark ? Colors.white70 : AppColors.loginTextMuted;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'VOICE SANCTUARY',
                      style: GoogleFonts.manrope(
                        fontSize: 11.sp,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w300,
                        color: bodyTextColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.SETTINGS),
                      child: SvgPicture.asset(
                        'assets/images/settings.svg',
                        height: 19.sp,
                        colorFilter: isDark
                            ? const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              )
                            : null,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12.h),
                  child: Text(
                    'The Voice of Your\nSoul',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 35.sp,
                      fontWeight: FontWeight.bold,
                      color: titleTextColor,
                      height: 1.2,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: Text(
                    'Capture the whispers of your intuition and\nthe rhythm of your healing journey.',
                    style: GoogleFonts.manrope(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w300,
                      color: bodyTextColor,
                      height: 1.5,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 35.h),
                  child: Obx(
                    () => Center(
                      child: CustomPaint(
                        size: Size(
                          (_barHeights.length * (_barWidth + _barSpacing) -
                              _barSpacing),
                          _maxBarHeight,
                        ),
                        painter: WaveformPainter(
                          barHeights: _barHeights,
                          barColors: isDark
                              ? _barColors
                                    .map(
                                      (c) => c == const Color(0xFF000000)
                                          ? Colors.white
                                          : Colors.white60,
                                    )
                                    .toList()
                              : _barColors,
                          maxHeight: _maxBarHeight,
                          barWidth: _barWidth,
                          barSpacing: _barSpacing,
                          barRadius: _barRadius,
                          amplitude: _amplitude,
                          animationValue: controller.wavePhase.value,
                          isRecording: controller.isRecording.value,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24.h),
                  child: Obx(
                    () => Center(
                      child: GestureDetector(
                        onTap: controller.toggleRecording,
                        child: Container(
                          width: 85.w,
                          height: 85.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: AppColors.loginButtonGradient,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.loginGoldStart.withValues(
                                  alpha: 0.35,
                                ),
                                blurRadius: 16,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Icon(
                            controller.isRecording.value
                                ? Icons.stop_rounded
                                : Icons.mic,
                            color: Colors.white,
                            size: 28.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Obx(
                    () => Center(
                      child: Text(
                        controller.isRecording.value
                            ? 'RECORDING...'
                            : 'TAP TO BEGIN',
                        style: GoogleFonts.outfit(
                          fontSize: 11.sp,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w600,
                          color: isDark
                              ? Colors.white70
                              : AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Journal Log',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w600,
                          color: titleTextColor,
                        ),
                      ),
                      Obx(
                        () => Text(
                          '${controller.recordings.length} RECORDINGS',
                          style: GoogleFonts.manrope(
                            fontSize: 12.sp,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w600,
                            color: isDark
                                ? Colors.white60
                                : AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
                Obx(
                  () => controller.isLoading.value
                      ? const Center(
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : controller.recordings.isEmpty
                          ? Padding(
                              padding: EdgeInsets.symmetric(vertical: 40.h),
                              child: Center(
                                child: Text(
                                  'No recordings yet.\nTap the mic to start recording.',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.manrope(
                                    fontSize: 14.sp,
                                    color: bodyTextColor,
                                  ),
                                ),
                              ),
                            )
                          : Column(
                              children: controller.recordings
                                  .map((recording) => Padding(
                                        padding:
                                            EdgeInsets.only(bottom: 10.h),
                                        child: _buildJournalCard(
                                          context: context,
                                          title: recording.title,
                                          subtitle: _formatDate(recording.createdAt),
                                          url: recording.url,
                                          recordingId: recording.id,
                                        ),
                                      ))
                                  .toList(),
                            ),
                ),
                SizedBox(height: 32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return '${months[date.month - 1]} ${date.day} • ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }

  Widget _buildJournalCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    String? url,
    String? recordingId,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        if (url != null && recordingId != null) {
          controller.playAudio(recordingId, url);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E1E1E) : AppColors.cardBg,
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Row(
          children: [
            Obx(
              () => Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDark ? const Color(0xFF2E2E2E) : AppColors.white,
                ),
                child: Icon(
                  controller.currentlyPlayingId.value == recordingId &&
                          controller.isPlaying.value
                      ? Icons.pause_rounded
                      : Icons.play_arrow_rounded,
                  color: isDark ? AppColors.primary : const Color(0XFF735C00),
                  size: 20.sp,
                ),
              ),
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.white : AppColors.loginTextDark,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    subtitle,
                    style: GoogleFonts.manrope(
                      fontSize: 14.sp,
                      color: isDark ? Colors.white70 : AppColors.loginTextMuted,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
