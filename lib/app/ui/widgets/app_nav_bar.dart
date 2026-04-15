import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/ui/theme/app_colors.dart';
import 'package:swanlife/gen/assets.gen.dart';

class AppNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppNavBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 20.h),
      decoration: BoxDecoration(
        color: Color(0XFFFFF8F6),
        borderRadius: BorderRadius.circular(40.r),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withValues(alpha: 0.06),
        //     blurRadius: 12,
        //     offset: const Offset(0, -2),
        //   ),
        // ],
      ),
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(
            svgPath: Assets.icons.home,
            svgPathSelected: Assets.icons.homeBlack,
            label: 'HOME',
            isSelected: currentIndex == 0,
            onTap: () => onTap(0),
          ),
          _NavItem(
            svgPath: Assets.icons.journal,
            svgPathSelected: Assets.icons.journalBlack,
            label: 'JOURNAL',
            isSelected: currentIndex == 1,
            onTap: () => onTap(1),
          ),
          _NavItem(
            svgPath: Assets.icons.audio,
            svgPathSelected: Assets.icons.audioBlack,
            label: 'AUDIO',
            isSelected: currentIndex == 2,
            onTap: () => onTap(2),
          ),
          _NavItem(
            svgPath: Assets.icons.profile,
            svgPathSelected: Assets.icons.profileBlack,
            label: 'PROFILE',
            isSelected: currentIndex == 3,
            onTap: () => onTap(3),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String svgPath;
  final String svgPathSelected;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.svgPath,
    required this.svgPathSelected,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 70.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              isSelected ? svgPathSelected : svgPath,
              width: 20.sp,
              height: 20.sp,
            ),
            SizedBox(height: 5.h),
            Text(
              label,
              style: GoogleFonts.manrope(
                fontSize: 9.sp,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                letterSpacing: 1.0,
                color: isSelected ? AppColors.black : Color(0xFF867474),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
