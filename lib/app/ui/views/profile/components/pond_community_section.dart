import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/ui/theme/app_colors.dart';

class PondCommunitySection extends StatelessWidget {
  final double progress;
  final String description;
  final int textEntries;
  final int videoEntries;
  final int mediaEntries;

  const PondCommunitySection({
    super.key,
    required this.progress,
    required this.description,
    this.textEntries = 0,
    this.videoEntries = 0,
    this.mediaEntries = 0,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final percent = (progress * 100).round();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CURRENT EVOLUTION',
          style: GoogleFonts.manrope(
            fontSize: 9.sp,
            letterSpacing: 1.6,
            fontWeight: FontWeight.w400,
            color: scheme.onSurfaceVariant,
          ),
        ),
        SizedBox(height: 6.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'The Pond Community',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w600,
                      color: scheme.onSurface,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    description,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 15.sp,
                      color: scheme.onSurfaceVariant,
                      height: 1.45,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.w),
            // Large % badge
            Column(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '$percent',
                        style: GoogleFonts.notoSerif(
                          fontSize: 48.sp,
                          fontWeight: FontWeight.w400,
                          color: scheme.onSurface,
                          height: 1,
                        ),
                      ),
                      TextSpan(
                        text: '%',
                        style: GoogleFonts.manrope(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  'Activity',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.loginTextDark,
                    letterSpacing: 0.8,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 16.h),
        // ── Activity breakdown pills ──────────────────────────
        Row(
          children: [
            _StatPill(
              icon: Icons.edit_note_rounded,
              label: 'Journal\nEntries',
              count: textEntries,
            ),
            SizedBox(width: 10.w),
            _StatPill(
              icon: Icons.videocam_outlined,
              label: 'Video\nEntries',
              count: videoEntries,
            ),
            SizedBox(width: 10.w),
            _StatPill(
              icon: Icons.perm_media_outlined,
              label: 'Media\nAdded',
              count: mediaEntries,
            ),
          ],
        ),
        SizedBox(height: 14.h),
        // ── Progress bar ─────────────────────────────────────
        ClipRRect(
          borderRadius: BorderRadius.circular(999.r),
          child: SizedBox(
            height: 4.h,
            width: double.infinity,
            child: Stack(
              children: [
                Container(width: double.infinity, color: AppColors.white),
                FractionallySizedBox(
                  widthFactor: progress,
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: AppColors.primaryGradient,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _StatPill extends StatelessWidget {
  final IconData icon;
  final String label;
  final int count;

  const _StatPill({
    required this.icon,
    required this.label,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 18.sp, color: const Color(0xFF735C00)),
            SizedBox(width: 6.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$count',
                    style: GoogleFonts.notoSerif(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: scheme.onSurface,
                      height: 1,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    label,
                    style: GoogleFonts.manrope(
                      fontSize: 9.sp,
                      color: scheme.onSurfaceVariant,
                      fontWeight: FontWeight.w400,
                      height: 1.3,
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

