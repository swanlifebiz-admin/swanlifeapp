import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/ui/theme/app_colors.dart';

class HomeGreetingSection extends StatelessWidget {
  const HomeGreetingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 12.h, left: 20.w),
          child: Text(
            "TODAY'S JOURNEY",
            style: GoogleFonts.outfit(
              fontSize: 12.sp,
              letterSpacing: 2.0,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 2.h, left: 20.w, right: 20.w),
          child: Text(
            'Welcome to your Elevation,\nEbera.',
            style: GoogleFonts.playfairDisplay(
              fontSize: 23.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.loginTextDark,
              height: 1.3,
            ),
          ),
        ),
      ],
    );
  }
}
