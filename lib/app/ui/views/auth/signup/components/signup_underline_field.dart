import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/ui/theme/app_colors.dart';

class SignupUnderlineField extends StatelessWidget {
  const SignupUnderlineField({
    super.key,
    required this.label,
    required this.controller,
    this.hint,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.obscureText = false,
    this.labelTopSpacing = 16,
  });

  final String label;
  final TextEditingController controller;
  final String? hint;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final bool obscureText;
  final double labelTopSpacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: labelTopSpacing.h,
            left: 24.w,
            right: 24.w,
          ),
          child: Text(
            label,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12.sp,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w600,
              color: AppColors.loginTextDark,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            textCapitalization: textCapitalization,
            obscureText: obscureText,
            style: GoogleFonts.manrope(
              fontSize: 15.sp,
              color: AppColors.loginTextDark,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: GoogleFonts.outfit(
                fontSize: 15.sp,
                color: AppColors.loginTextMuted.withValues(alpha: 0.6),
              ),
              filled: false,
              contentPadding: EdgeInsets.symmetric(vertical: 12.h),
              border: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFD5C5C5)),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.loginGoldStart,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
