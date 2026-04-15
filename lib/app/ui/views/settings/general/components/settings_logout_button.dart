import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/ui/theme/app_colors.dart';
import 'package:swanlife/app/ui/widgets/custom_text_widget.dart';

class SettingsLogoutButton extends StatelessWidget {
  const SettingsLogoutButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Ink(
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: AppColors.loginButtonGradient,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF8B6E2F).withValues(alpha: 0.22),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: CustomTextWidget(
              text: 'Log Out',
              style: GoogleFonts.manrope(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
