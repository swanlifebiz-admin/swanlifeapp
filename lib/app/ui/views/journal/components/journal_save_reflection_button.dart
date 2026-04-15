import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/ui/theme/app_colors.dart';

class JournalSaveReflectionButton extends StatelessWidget {
  const JournalSaveReflectionButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 15.h),
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(999.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.loginGoldStart.withValues(alpha: 0.23),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'SAVE REFLECTION',
              style: GoogleFonts.manrope(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.1,
              ),
            ),
            SizedBox(width: 6.w),
            Icon(Icons.auto_awesome_outlined, color: Colors.white, size: 11.sp),
          ],
        ),
      ),
    );
  }
}
