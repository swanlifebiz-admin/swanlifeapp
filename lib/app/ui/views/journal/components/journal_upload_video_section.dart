import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/ui/views/journal/components/journal_attachment_tile.dart';
import 'package:swanlife/app/ui/views/journal/components/journal_audio_recorder_sheet.dart';
import 'package:swanlife/app/ui/views/journal/components/journal_upload_card.dart';
import 'package:swanlife/app/ui/theme/app_colors.dart';

class JournalUploadVideoSection extends StatelessWidget {
  const JournalUploadVideoSection({
    super.key,
    required this.hasVideo,
    required this.onPickVideo,
    required this.onClearVideo,
    required this.hasAudio,
    required this.onClearAudio,
    required this.hasImage,
    required this.onPickImage,
    required this.onClearImage,
  });

  final bool hasVideo;
  final VoidCallback onPickVideo;
  final VoidCallback onClearVideo;

  final bool hasAudio;
  final VoidCallback onClearAudio;

  final bool hasImage;
  final VoidCallback onPickImage;
  final VoidCallback onClearImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 25.h),
      decoration: BoxDecoration(
        color: const Color(0xFFfcedf2),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'UPLOAD VIDEO',
                style: GoogleFonts.manrope(
                  fontSize: 12.sp,
                  letterSpacing: 1.8,
                  color: const Color(0xFF856B22),
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (hasVideo)
                GestureDetector(
                  onTap: onClearVideo,
                  child: Icon(Icons.close, size: 20.sp, color: AppColors.error),
                ),
            ],
          ),
          SizedBox(height: 16.h),
          if (hasVideo)
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 24.h),
              decoration: BoxDecoration(
                color: AppColors.cardBg,
                borderRadius: BorderRadius.circular(9.r),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.3),
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: AppColors.success,
                    size: 36.sp,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Video Selected',
                    style: GoogleFonts.manrope(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            )
          else
            JournalUploadCard(onTap: onPickVideo),
          SizedBox(height: 10.h),
          JournalAttachmentTile(
            icon: Icons.mic_none_rounded,
            title: 'Audio Note',
            subtitle: 'Record A Quick Thought',
            isAttached: hasAudio,
            onTap: () => Get.bottomSheet(
              const JournalAudioRecorderSheet(),
              isScrollControlled: true,
              enableDrag: true,
            ),
            onClear: onClearAudio,
          ),
          SizedBox(height: 8.h),
          JournalAttachmentTile(
            icon: Icons.image_outlined,
            title: 'Journal Entries',
            subtitle: 'Add Your Thoughts',
            isAttached: hasImage,
            onTap: onPickImage,
            onClear: onClearImage,
          ),
        ],
      ),
    );
  }
}
