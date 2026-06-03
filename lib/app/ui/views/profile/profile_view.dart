import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/controllers/profile_controller.dart';
import 'package:swanlife/app/ui/views/profile/components/essence_input_field.dart';
import 'package:swanlife/app/ui/views/profile/components/feed_section.dart';
import 'package:swanlife/app/ui/views/profile/components/pond_community_section.dart';
import 'package:swanlife/app/ui/views/profile/components/section_title.dart';
import 'package:swanlife/app/ui/views/profile/components/stats_row.dart';
import 'package:swanlife/app/ui/views/profile/components/step_field.dart';
import 'package:swanlife/app/ui/views/profile/components/top_profile_section.dart';
import 'package:swanlife/app/ui/views/profile/components/vision_card.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final horizontalPadding = (constraints.maxWidth * 0.06).clamp(
              18.0,
              28.0,
            );
            final contentMaxWidth = constraints.maxWidth > 760
                ? 720.0
                : constraints.maxWidth;

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Center(
                child: SizedBox(
                  width: contentMaxWidth,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.h, bottom: 120.h),
                    child: Obx(() {
                      final profile = controller.profile.value;
                      Widget withHorizontalInset(Widget child) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                          child: child,
                        );
                      }

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          withHorizontalInset(
                            TopProfileSection(
                              imageUrl: profile.avatarImageUrl,
                              name: profile.name,
                              subtitle: profile.rankSubtitle,
                              onEditPhoto: controller.updateProfilePicture,
                            ),
                          ),
                          SizedBox(height: 28.h),
                          withHorizontalInset(
                            StatsRow(
                              leftValue: '${profile.daysActive}',
                              leftLabel: 'DAYS ACTIVE',
                              rightValue: '${profile.reflections}',
                              rightLabel: 'REFLECTIONS',
                            ),
                          ),
                          SizedBox(height: 30.h),
                          withHorizontalInset(
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SectionTitle(title: 'Core Essence'),
                                Obx(() {
                                  final status = controller.saveStatus.value;
                                  if (status.isEmpty) return const SizedBox.shrink();

                                  final isSaving = status == 'Saving...';
                                  final isError = status == 'Error';

                                  return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      if (isSaving)
                                        SizedBox(
                                          width: 10.w,
                                          height: 10.w,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 1.5,
                                            valueColor: AlwaysStoppedAnimation<Color>(scheme.primary),
                                          ),
                                        )
                                      else if (isError)
                                        Icon(
                                          Icons.error_outline_rounded,
                                          size: 14.sp,
                                          color: Colors.red,
                                        )
                                      else
                                        Icon(
                                          Icons.check_circle_outline_rounded,
                                          size: 14.sp,
                                          color: Colors.green,
                                        ),
                                      SizedBox(width: 6.w),
                                      Text(
                                        status,
                                        style: GoogleFonts.manrope(
                                          fontSize: 12.sp,
                                          color: isSaving
                                              ? scheme.onSurfaceVariant
                                              : (isError ? Colors.red : Colors.green),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                              ],
                            ),
                          ),
                          SizedBox(height: 14.h),
                          
                          withHorizontalInset(
                            EssenceInputField(
                              icon: Icons.auto_awesome_outlined,
                              label: 'Intentional Presence',
                              hintText: 'Type here...',
                              controller: controller.intentionalPresenceController,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          withHorizontalInset(
                            EssenceInputField(
                              icon: Icons.diamond_outlined,
                              label: 'Wealth Mindset',
                              hintText: 'Type here...',
                              controller: controller.wealthMindsetController,
                            ),
                          ),
                          SizedBox(height: 22.h),
                          withHorizontalInset(VisionCard(quote: profile.visionQuote)),
                          SizedBox(height: 28.h),
                          withHorizontalInset(
                            PondCommunitySection(
                              progress: profile.evolutionProgress,
                              description: profile.pondDescription,
                              textEntries: profile.textEntries,
                              videoEntries: profile.videoEntries,
                              mediaEntries: profile.mediaEntries,
                            ),
                          ),
                          SizedBox(height: 30.h),
                          withHorizontalInset(
                            StepField(
                              step: 'STEP 01',
                              title: 'Boundary Setting',
                              controller: controller.boundarySettingController,
                              trailingIcon: Icons.mic_none_rounded,
                              hintText: 'Record your audio',
                            ),
                          ),
                          SizedBox(height: 16.h),
                          withHorizontalInset(
                            StepField(
                              step: 'STEP 06',
                              title: 'The Swan-Shares',
                              description:
                                  'Document one meaningful shift you noticed this week.',
                              controller: controller.swanSharesController,
                              trailingIcon: Icons.email_outlined,
                              hintText: 'Enter email',
                              iconInHeader: true,
                              isEditable: true,
                            ),
                          ),
                          SizedBox(height: 28.h),
                          FeedSection(
                            feedItems: controller.feedItems,
                            horizontalPadding: horizontalPadding,
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
