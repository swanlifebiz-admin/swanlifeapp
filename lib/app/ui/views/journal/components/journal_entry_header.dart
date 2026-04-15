import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/ui/theme/app_colors.dart';

class JournalEntryHeader extends StatelessWidget {
  const JournalEntryHeader({super.key, required this.dateText});

  final String dateText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'WRITE ENTRY',
          style: GoogleFonts.manrope(
            fontSize: 12.sp,
            letterSpacing: 1.45,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        Text(
          dateText,
          style: GoogleFonts.manrope(
            fontSize: 12.sp,
            letterSpacing: 1,
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
