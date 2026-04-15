import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/ui/theme/app_colors.dart';

class HomeSectionHeader extends StatelessWidget {
  const HomeSectionHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Text(
        title,
        style: GoogleFonts.plusJakartaSans(
          fontSize: 19.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.loginTextDark,
        ),
      ),
    );
  }
}
