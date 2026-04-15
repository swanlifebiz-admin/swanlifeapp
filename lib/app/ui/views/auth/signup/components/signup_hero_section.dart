import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/ui/theme/app_colors.dart';
import 'package:swanlife/gen/assets.gen.dart';

class SignupHeroSection extends StatelessWidget {
  const SignupHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: Center(
            child: Assets.images.primary.image(
              height: 110.h,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.h, right: 210.w),
          child: Text(
            'THE BEGINNING',
            style: GoogleFonts.manrope(
              fontSize: 12.sp,
              letterSpacing: 2.5,
              color: AppColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 6.h, left: 2.w, right: 2.w),
          child: Text(
            'Your Transformation\nAwaits.',
            textAlign: TextAlign.center,
            style: GoogleFonts.playfairDisplay(
              fontSize: 34.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.loginTextDark,
              height: 1.2,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.h, left: 22.w, right: 22.w),
          child: Text(
            'Join an exclusive community dedicated to the art of becoming. Our sanctuary provides the silence needed to hear your inner voice.',
            textAlign: TextAlign.start,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 14.sp,
              color: Color(0XFF070707),
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
