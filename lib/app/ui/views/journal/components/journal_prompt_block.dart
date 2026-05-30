import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/ui/theme/app_colors.dart';

class JournalPromptBlock extends StatelessWidget {
  const JournalPromptBlock({
    super.key,
    required this.answerLabel,
    required this.controller,
    required this.hintText,
  });

  final String answerLabel;
  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          answerLabel,
          style: GoogleFonts.manrope(
            fontSize: 10.sp,
            letterSpacing: 1.35,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 8.h),
        TextField(
          controller: controller,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          style: GoogleFonts.notoSerif(
            fontSize: 16.sp,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.notoSerif(
              fontSize: 16.sp,
              color: AppColors.textSecondary.withValues(alpha: 0.5),
              fontWeight: FontWeight.w400,
            ),
            border: InputBorder.none,
            isDense: true,
            contentPadding: EdgeInsets.zero,
          ),
        ),
        SizedBox(height: 8.h),
        Container(height: 1.h, color: AppColors.textSecondary),
      ],
    );
  }
}
