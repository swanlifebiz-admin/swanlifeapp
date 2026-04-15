import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/ui/theme/app_colors.dart';

class SignupTermsRow extends StatelessWidget {
  const SignupTermsRow({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, left: 12.w, right: 24.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform.scale(
            scale: 1.2,
            child: Padding(
              padding: EdgeInsets.only(top: 4.h),
              child: Checkbox(
                value: value,
                onChanged: onChanged,
                activeColor: AppColors.loginGoldStart,
                side: BorderSide(color: AppColors.loginTextMuted, width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r),
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
              ),
            ),
          ),
          SizedBox(width: 4.w),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: RichText(
                text: TextSpan(
                  style: GoogleFonts.manrope(
                    fontSize: 12.sp,
                    color: AppColors.black,
                    height: 1.4,
                  ),
                  children: [
                    TextSpan(
                      text: 'I accept the ',
                      style: GoogleFonts.manrope(
                        fontSize: 12.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: 'Terms of Sanctuary',
                      style: GoogleFonts.manrope(
                        fontSize: 12.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.black,
                        decorationThickness: 2,
                      ),
                    ),
                    TextSpan(
                      text: ' and acknowledge\nthe ',
                      style: GoogleFonts.manrope(
                        fontSize: 12.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: 'privacy policy',
                      style: GoogleFonts.manrope(
                        fontSize: 12.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.black,
                        decorationThickness: 2,
                      ),
                    ),
                    const TextSpan(text: '.'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
