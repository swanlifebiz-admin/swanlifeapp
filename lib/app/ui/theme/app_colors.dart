import 'package:flutter/material.dart';

class AppColors {
  // Primary Palette
  static const Color primary = Color(0xFFBA9E6B); // Gold/Bronze
  static const Color secondary = Color(0xFFF5B0C5); // Swan Pink
  
  // Neutral Colors
  static const Color background = Color(0xFFFDF2F9); // Soft Pink Background
  static const Color surface = Color(0xFFFFFFFF);
  static const Color error = Color(0xFFEF4444);
  
  // Text Colors
  static const Color textPrimary = Color(0xFF3A2A22); // Dark Coffee
  static const Color textSecondary = Color(0xFF6B5E59); // Muted Brown
  static const Color textHint = Color(0xFF94A3B8);
  
  // Accents
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFFBBF24);
  
  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFFBA9E6B), Color(0xFF8B7344)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
