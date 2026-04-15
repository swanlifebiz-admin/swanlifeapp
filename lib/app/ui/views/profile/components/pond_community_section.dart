import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/ui/theme/app_colors.dart';

class PondCommunitySection extends StatelessWidget {
  final double progress;
  final String description;

  const PondCommunitySection({
    super.key,
    required this.progress,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

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
          crossAxisAlignment: CrossAxisAlignment.end,
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
                      fontSize: 16.sp,
                      color: scheme.onSurfaceVariant,
                      height: 1.45,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Text(
                      '${(progress * 100).round()}',
                      style: GoogleFonts.notoSerif(
                        fontSize: 50.sp,
                        fontWeight: FontWeight.w400,
                        color: scheme.onSurface,
                        height: 1,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Entries',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.loginTextDark,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: Text(
                    '%',
                    style: GoogleFonts.manrope(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 14.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(999.r),
          child: SizedBox(
            height: 4.h,
            width: double.infinity,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      color: AppColors.white,
                    ),
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
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
