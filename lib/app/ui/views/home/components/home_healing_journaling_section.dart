import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/ui/theme/app_colors.dart';
import 'package:swanlife/app/ui/views/home/components/home_gold_pill_button.dart';

class HomeHealingJournalingSection extends StatelessWidget {
  const HomeHealingJournalingSection({super.key, required this.onOpenJournal});

  final VoidCallback onOpenJournal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Healing Journaling',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 19.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.loginTextDark,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            'Release the shadow of yesterday. Today\'s\nprompt explores the beauty of quiet\ntransitions.',
            style: GoogleFonts.manrope(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.loginTextMuted,
              height: 1.5,
            ),
          ),
          SizedBox(height: 14.h),
          HomeGoldPillButton(text: 'Open Journal ', onTap: onOpenJournal),
        ],
      ),
    );
  }
}
