import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/ui/theme/app_colors.dart';
import 'package:swanlife/app/ui/views/journal/components/journal_entry_header.dart';
import 'package:swanlife/app/ui/views/journal/components/journal_prompt_block.dart';
import 'package:swanlife/app/ui/views/journal/components/journal_save_reflection_button.dart';
import 'package:swanlife/app/ui/views/journal/components/journal_upload_video_section.dart';

class JournalView extends StatelessWidget {
  const JournalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 420.w),
              child: Padding(
                padding: EdgeInsets.fromLTRB(18.w, 12.h, 18.w, 120.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.h),
                    Text(
                      'Capturing Clarity',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 35.sp,
                        color: AppColors.loginTextDark,
                        fontWeight: FontWeight.w400,
                        height: 1.06,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Your journey is a masterpiece in progress. '
                      'Document the frequencies of your growth.',
                      style: GoogleFonts.manrope(
                        fontSize: 17.sp,
                        height: 1.45,
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 20.h),

                    const JournalEntryHeader(dateText: 'OCTOBER 24, 2025'),

                    SizedBox(height: 18.h),
                    const JournalPromptBlock(
                      answerLabel: 'TRUE REFLECTION',
                      answerText: 'A moment of stillness...',
                    ),
                    SizedBox(height: 14.h),
                    const JournalPromptBlock(
                      answerLabel: 'THE ANSWER',
                      answerText: 'Start typing your truth...',
                    ),
                    SizedBox(height: 35.h),
                    Center(
                      child: SizedBox(
                        width: 230.w,
                        child: JournalSaveReflectionButton(onTap: () {}),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    const JournalUploadVideoSection(),
                    SizedBox(height: 14.h),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 18.w,
                        vertical: 24.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFf2cecf),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Reflective Prompt',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 14.sp,
                              height: 1.45,
                              color: AppColors.loginTextDark,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            '"What is one thing you released today to make room for its light?"',
                            style: GoogleFonts.manrope(
                              fontSize: 14.sp,
                              height: 1.45,
                              color: AppColors.loginTextDark,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
