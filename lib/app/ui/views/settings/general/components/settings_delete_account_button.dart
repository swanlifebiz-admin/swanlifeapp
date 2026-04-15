import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/ui/theme/app_colors.dart';
import 'package:swanlife/app/ui/views/settings/general/components/settings_tokens.dart';
import 'package:swanlife/app/ui/widgets/custom_text_widget.dart';

class SettingsDeleteAccountButton extends StatelessWidget {
  const SettingsDeleteAccountButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: SettingsTokens.deleteAccountGrey,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: CustomTextWidget(
          text: 'DELETE ACCOUNT',
          style: GoogleFonts.manrope(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
            color: AppColors.black,),
        ),
      ),
    );
  }
}
