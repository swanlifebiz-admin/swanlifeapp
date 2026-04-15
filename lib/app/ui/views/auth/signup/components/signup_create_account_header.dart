import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/ui/theme/app_colors.dart';

class SignupCreateAccountHeader extends StatelessWidget {
  const SignupCreateAccountHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.h, left: 24.w, right: 24.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Create Account',
                style: GoogleFonts.outfit(
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.loginTextDark,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 4.h, left: 24.w, right: 24.w),
          child: Text(
            'Step into your new identity.',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
          ),
        ),
      ],
    );
  }
}
