import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/ui/theme/app_colors.dart';

class VisionCard extends StatelessWidget {
  final String quote;

  const VisionCard({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(24.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
          decoration: BoxDecoration(
            color: const Color(0XFFFFF1ED),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'The Vision',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w600,
                  color: scheme.onSurface,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                quote,
                style: GoogleFonts.manrope(
                  fontSize: 15.sp,
                  color: scheme.onSurfaceVariant,
                  height: 1.5,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 14.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(999.r),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.circular(999.r),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 10.h,
                      ),
                      child: Text(
                        'Edit Identity',
                        style: GoogleFonts.manrope(
                          fontSize: 10.sp,
                          letterSpacing: 1.1,
                          color: scheme.onPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
