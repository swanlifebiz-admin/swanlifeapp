import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/ui/theme/app_colors.dart';
import 'package:swanlife/app/ui/views/settings/notification/components/notification_type_card.dart';

/// Notification types: reminders and updates (matches SwanLife notification UI).
class NotificationSettingsView extends StatefulWidget {
  const NotificationSettingsView({super.key});

  @override
  State<NotificationSettingsView> createState() =>
      _NotificationSettingsViewState();
}

class _NotificationSettingsViewState extends State<NotificationSettingsView> {
  static const Color _cardBg = Color(0xFFFFF5F0);
  static const Color _accentGold = Color(0xFFC5A059);
  static const Color _titleDark = Color(0xFF2B2B2B);
  static const Color _subtitleGrey = Color(0xFF8A8580);

  bool _remindersOn = true;
  bool _updatesOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Notification',
          style: GoogleFonts.notoSerif(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: _titleDark.withValues(alpha: 0.9),
          ),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 19.sp,
            color: _titleDark.withValues(alpha: 0.85),
          ),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          children: [
            const SizedBox(height: 20),
            Text(
              'Notification Types',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 19.sp,
                fontWeight: FontWeight.w600,
                color: _titleDark,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 14),
            NotificationTypeCard(
              cardBg: _cardBg,
              accent: _accentGold,
              titleDark: _titleDark,
              subtitleGrey: _subtitleGrey,
              iconPath: 'assets/images/notification.svg',
              title: 'Reminders',
              description: 'Gentle nudges for your daily rituals.',
              value: _remindersOn,
              onChanged: (v) => setState(() => _remindersOn = v),
            ),
            const SizedBox(height: 12),
            NotificationTypeCard(
              cardBg: _cardBg,
              accent: _accentGold,
              titleDark: _titleDark,
              subtitleGrey: _subtitleGrey,
              iconPath: 'assets/images/updates.svg',
              title: 'Updates',
              description: 'New features and SwanLife community news.',
              value: _updatesOn,
              onChanged: (v) => setState(() => _updatesOn = v),
            ),
          ],
        ),
      ),
    );
  }
}
