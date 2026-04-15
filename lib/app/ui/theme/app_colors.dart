import 'package:flutter/material.dart';

class AppColors {
  // Primary Palette
  static const Color primary = Color(0xFFBA9E6B); // Gold/Bronze
  static const Color secondary = Color(0xFFF5B0C5); // Swan Pink
    static const Color white = Color(0xFFFFFFFF); // White


  // Neutral Colors
  // static const Color background = Color(0xFFFDF2F9); // Soft Pink Background
  static const Color loginBackground = Color(0xFFf4e5f6); // Soft Pink Background
    static const Color background = Color(0xFFFBE9EF); // Soft blush pink
  static const Color surface = Color(0xFFFFFFFF);
  static const Color error = Color(0xFFEF4444);

  // Text Colors
  static const Color textPrimary = Color(0xFF3A2A22); // Dark Coffee
  static const Color textSecondary = Color(0xFF6B5E59); // Muted Brown
  static const Color textHint = Color(0xFF94A3B8);
  static const Color black = Color(0xFF000000);
  static const Color lightBlack = Color(0xFF2C2B2B);

  // Accents
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFFBBF24);
    static const Color cardBg = Color(0xFFFFF5F0);


  // Login Screen Colors
  static const Color loginTextDark = Color(0xFF2B2B2B);
  static const Color loginTextMuted = Color(0xFFA08A8A);
  static const Color loginGoldStart = Color(0xFFC8A84B);
  static const Color loginGoldEnd = Color(0xFF8B6E2F);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    // colors: [Color(0xFFBA9E6B), Color(0xFF8B7344)],
    colors: [Color(0xFFFFE088), Color(0xFF735C00)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient loginButtonGradient = LinearGradient(
    colors: [Color(0xFFC8A84B), Color(0xFF8B6E2F)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
