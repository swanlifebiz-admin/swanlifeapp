import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swanlife/app/data/services/auth_service.dart';
import 'package:swanlife/app/controllers/main_shell_controller.dart';
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
  void initState() {
    super.initState();
    _themeOn = GetStorage().read<bool>('isDark') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.grey.withValues(alpha: 0.1),
        centerTitle: true,
        elevation: 0,
        title: CustomTextWidget(
          text: 'Setting',
          textAlign: TextAlign.center,
          style: GoogleFonts.notoSerif(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: isDark
                ? Colors.white
                : const Color(0xFF2B2B2B).withValues(alpha: 0.9),
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
                  onTap: () {
                    Get.back();
                    Get.find<MainShellController>().changePage(3);
                  },
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
                  onChanged: (v) {
                    setState(() {
                      _themeOn = v;
                    });
                    GetStorage().write('isDark', v);
                    Get.changeThemeMode(v ? ThemeMode.dark : ThemeMode.light);
                  },
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
                  onTap: () => _showHelpBottomSheet(context),
                ),
                SettingsNavTile(
                  iconPath: 'assets/images/feedback.svg',
                  label: 'Feedback',
                  onTap: () => _showFeedbackBottomSheet(context),
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
              padding: EdgeInsets.symmetric(horizontal: 16.w),
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

  void _showFeedbackBottomSheet(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textController = TextEditingController();
    final isLoading = false.obs;

    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Share your thoughts',
                  style: GoogleFonts.notoSerif(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : const Color(0xFF2B2B2B),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Get.back(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: textController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Tell us what we can improve...',
                hintStyle: TextStyle(
                  color: isDark ? Colors.white38 : Colors.black38,
                ),
                fillColor: isDark
                    ? const Color(0xFF2E2824)
                    : const Color(0xFFFFF5F0),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: isDark ? Colors.white : Colors.black),
            ),
            const SizedBox(height: 20),
            Obx(
              () => PrimaryButton(
                text: isLoading.value ? 'Sending...' : 'Submit Feedback',
                onTap: () async {
                  if (textController.text.trim().isEmpty) {
                    Get.snackbar('Error', 'Please enter some feedback');
                    return;
                  }
                  isLoading.value = true;
                  try {
                    final auth = Get.find<AuthService>();
                    final user = auth.user;
                    await FirebaseFirestore.instance
                        .collection('feedback')
                        .add({
                          'userId': user?.uid ?? 'anonymous',
                          'email': user?.email ?? 'anonymous',
                          'feedback': textController.text.trim(),
                          'createdAt': FieldValue.serverTimestamp(),
                        });
                    Get.back();
                    Get.snackbar(
                      'Thank You!',
                      'Feedback submitted successfully.',
                      backgroundColor: Colors.green.withOpacity(0.1),
                      colorText: Colors.green[800],
                    );
                  } catch (e) {
                    Get.snackbar('Error', 'Could not submit feedback: $e');
                  } finally {
                    isLoading.value = false;
                  }
                },
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  void _showHelpBottomSheet(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Help & FAQ',
                  style: GoogleFonts.notoSerif(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : const Color(0xFF2B2B2B),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Get.back(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildFAQItem(
              context,
              'How do I delete my account?',
              'You can request account deletion by scrolling to the bottom of the settings screen and pressing "Delete Account". All your data will be permanently wiped.',
            ),
            const SizedBox(height: 12),
            _buildFAQItem(
              context,
              'Where is my voice data stored?',
              'Your audio notes and voice sanctuary reflections are securely stored in private, encrypted Firebase Cloud Storage directories and are only accessible by you.',
            ),
            const SizedBox(height: 12),
            _buildFAQItem(
              context,
              'How do I edit my core essence?',
              'Go to the Profile tab, type in the Intentional Presence or Wealth Mindset boxes, and they will automatically auto-save to the cloud.',
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Still need help? Email support@swanlife.com',
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  color: isDark ? Colors.white60 : Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  Widget _buildFAQItem(BuildContext context, String question, String answer) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF2E2824) : const Color(0xFFFFF5F0),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: isDark ? Colors.white : const Color(0xFF2B2B2B),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            answer,
            style: GoogleFonts.manrope(
              fontSize: 14,
              color: isDark ? Colors.white70 : Colors.black87,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
