import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/controllers/journal_controller.dart';
import 'package:swanlife/app/ui/theme/app_colors.dart';
import 'package:swanlife/app/ui/views/journal/components/journal_entry_header.dart';
import 'package:swanlife/app/ui/views/journal/components/journal_prompt_block.dart';
import 'package:swanlife/app/ui/views/journal/components/journal_save_reflection_button.dart';
import 'package:swanlife/app/ui/views/journal/components/journal_upload_video_section.dart';

class JournalView extends GetView<JournalController> {
  const JournalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

                    const JournalEntryHeader(dateText: 'TODAY'),

                    SizedBox(height: 18.h),
                    JournalPromptBlock(
                      answerLabel: 'TRUE REFLECTION',
                      hintText: 'A moment of stillness...',
                      controller: controller.trueReflectionController,
                    ),
                    SizedBox(height: 14.h),
                    JournalPromptBlock(
                      answerLabel: 'THE ANSWER',
                      hintText: 'Start typing your truth...',
                      controller: controller.theAnswerController,
                    ),
                    SizedBox(height: 35.h),
                    Center(
                      child: SizedBox(
                        width: 230.w,
                        child: Obx(
                          () => controller.isLoading.value
                              ? Center(child: CircularProgressIndicator(color: AppColors.primary))
                              : JournalSaveReflectionButton(
                                  onTap: controller.saveReflection,
                                ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Obx(
                      () => JournalUploadVideoSection(
                        hasVideo: controller.selectedVideo.value != null,
                        onPickVideo: controller.pickVideo,
                        onClearVideo: controller.clearVideo,
                        hasAudio: controller.selectedAudio.value != null,
                        onClearAudio: controller.clearAudio,
                        hasImage: controller.selectedImage.value != null,
                        onPickImage: controller.pickImage,
                        onClearImage: controller.clearImage,
                      ),
                    ),
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

