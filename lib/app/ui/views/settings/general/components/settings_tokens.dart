import 'package:flutter/material.dart';

abstract final class SettingsTokens {
  static const Color lavenderBg = Color(0xFFF4E5F6);
  static const Color cardBg = Color(0xFFF5E9E6);
  static const Color sectionTitleColor = Color(0xCC2B2B2B);
  static const Color deleteAccountGrey = Color(0xFF8A8A8A);

  static Color getIconColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.white70
        : const Color(0xFF5C5656);
  }

  static Color getTileLabelColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : const Color(0xFF2B2B2B);
  }

  static Color getCardBgColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFF2E2824)
        : const Color(0xFFFFF5F0);
  }

  static Color getTitleColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : const Color(0xFF2B2B2B);
  }
}

