import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/routes/app_routes.dart';
import 'package:swanlife/app/ui/theme/app_colors.dart';
import 'package:swanlife/app/ui/views/settings/general/components/settings_delete_account_button.dart';
import 'package:swanlife/app/ui/views/settings/general/components/settings_nav_tile.dart';
import 'package:swanlife/app/ui/views/settings/general/components/settings_section_card.dart';
import 'package:swanlife/app/ui/views/settings/general/components/settings_toggle_tile.dart';
import 'package:swanlife/app/ui/widgets/custom_text_widget.dart';
import 'package:swanlife/app/ui/widgets/primary_button.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool _themeOn = false;
  bool _communityOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        surfaceTintColor: AppColors.cardBg,
        shadowColor: Colors.grey.withValues(alpha: 0.1),
        centerTitle: true,
        elevation: 0,
        title: CustomTextWidget(
          text: 'Setting',
          textAlign: TextAlign.center,
          style: GoogleFonts.notoSerif(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF2B2B2B).withValues(alpha: 0.9),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          children: [
            // const SettingsScreenHeader(),
            const SizedBox(height: 24),
            SettingsSectionCard(
              title: 'Account',
              children: [
                SettingsNavTile(
                  iconPath: 'assets/images/profile.svg',
                  label: 'Profile',
                  onTap: () {},
                ),
                SettingsNavTile(
                  iconPath: 'assets/images/notification1.svg',
                  label: 'Notifications',
                  iconHeight: 20,
                  onTap: () => Get.toNamed(Routes.NOTIFICATION_SETTINGS),
                ),
                SettingsNavTile(
                  iconPath: 'assets/images/data.svg',
                  label: 'Data',
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            SettingsSectionCard(
              title: 'Preferences',
              children: [
                SettingsToggleTile(
                  iconPath: 'assets/images/theme.svg',
                  label: 'Theme',
                  value: _themeOn,
                  onChanged: (v) => setState(() => _themeOn = v),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SettingsSectionCard(
              title: 'Support',
              children: [
                SettingsNavTile(
                  iconPath: 'assets/images/help.svg',
                  label: 'Help',
                  onTap: () {},
                ),
                SettingsNavTile(
                  iconPath: 'assets/images/feedback.svg',
                  label: 'Feedback',
                  onTap: () {},
                ),
                SettingsToggleTile(
                  iconPath: 'assets/images/community.svg',
                  label: 'Community',
                  iconHeight: 16,
                  value: _communityOn,
                  onChanged: (v) => setState(() => _communityOn = v),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SettingsSectionCard(
              title: 'Privacy',
              children: [
                SettingsNavTile(
                  iconPath: 'assets/images/policy.svg',
                  iconHeight: 19,
                  label: 'Policy',
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            SettingsSectionCard(
              title: 'Share to Social Media',
              children: [
                SettingsNavTile(
                  iconPath: 'assets/images/share.svg',
                  label: 'Share Post',
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 28),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.w),
              child: PrimaryButton(
                text: "Log Out",
                onTap: () => Get.offAllNamed(Routes.SPLASH),
              ),
            ),
             SizedBox(height: 20.h),
            SettingsDeleteAccountButton(onPressed: () {}),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}
