import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/ui/theme/app_colors.dart';

class JournalAttachmentTile extends StatelessWidget {
  const JournalAttachmentTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.isAttached = false,
    this.onClear,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool isAttached;
  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isAttached ? null : onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isAttached ? AppColors.cardBg : Colors.white,
          borderRadius: BorderRadius.circular(7.r),
          border: isAttached
              ? Border.all(color: AppColors.primary.withValues(alpha: 0.3))
              : null,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              isAttached ? Icons.check_circle_outline : icon,
              size: 20.sp,
              color: isAttached ? AppColors.success : const Color(0xFF8E760E),
            ),
            SizedBox(width: 7.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14.sp,
                      color: AppColors.loginTextDark,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    isAttached ? 'Attached' : subtitle,
                    style: GoogleFonts.manrope(
                      fontSize: 12.sp,
                      color: isAttached ? AppColors.success : AppColors.loginTextMuted,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            if (isAttached && onClear != null)
              GestureDetector(
                onTap: onClear,
                child: Icon(
                  Icons.close,
                  size: 20.sp,
                  color: AppColors.error,
                ),
              )
            else if (!isAttached)
              Icon(
                Icons.chevron_right_rounded,
                size: 16.sp,
                color: const Color(0xFFC4B9B6),
              ),
          ],
        ),
      ),
    );
  }
}
