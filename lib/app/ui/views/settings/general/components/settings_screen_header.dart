import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/ui/widgets/custom_text_widget.dart';

class SettingsScreenHeader extends StatelessWidget {
  const SettingsScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomTextWidget(
        text: 'Setting',
        textAlign: TextAlign.center,
        style: GoogleFonts.notoSerif(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF2B2B2B).withValues(alpha: 0.9),
        ),
      ),
    );
  }
}
