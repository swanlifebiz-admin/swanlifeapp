import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/ui/theme/app_colors.dart';
import 'package:swanlife/core/utils/url_helper.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeFeaturedGuideCard extends StatelessWidget {
  const HomeFeaturedGuideCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: GestureDetector(
        onTap: () => UrlHelper.launchURL(
          'https://share.google/hodM9KzLp6XoBmPgf',
          mode: LaunchMode.externalApplication,
        ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 30.h),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.82),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset('assets/images/wallet.svg', width: 35.w),
              SizedBox(height: 15.h),
              Text(
                'SwanLife Guides',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.loginTextDark,
                  height: 1.1,
                ),
              ),
              SizedBox(height: 9.h),
              Text(
                'Align your spending with your soul\'s\ndeepest intentions.',
                style: GoogleFonts.manrope(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.loginTextMuted,
                  height: 1.45,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
