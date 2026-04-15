import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/ui/theme/app_colors.dart';

class JournalUploadCard extends StatelessWidget {
  const JournalUploadCard({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: const Color(0xFFefdfdb),
        borderRadius: BorderRadius.circular(9.r),
      ),
      child: Column(
        children: [
          SizedBox(height: 35.h),
          Container(
            width: 55.w,
            height: 55.w,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.videocam_rounded,
              size: 30.sp,
              color: const Color(0xFF735C00),
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            'Visual Narrative',
            style: GoogleFonts.manrope(
              fontSize: 15.sp,
              color: AppColors.loginTextDark,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            'Capture the essence of your\nenvironment and energy.',
            textAlign: TextAlign.center,
            style: GoogleFonts.manrope(
              fontSize: 13.sp,
              color: AppColors.textSecondary,
              height: 1.35,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 16.h),
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F5F4),
                borderRadius: BorderRadius.circular(999.r),
                border: Border.all(color: const Color(0xFFD8CCCA), width: 1),
              ),
              child: Text(
                'SELECT FILE',
                style: GoogleFonts.manrope(
                  fontSize: 12.sp,
                  letterSpacing: 0.9,
                  color: AppColors.loginTextDark,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
