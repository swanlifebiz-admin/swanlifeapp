import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/ui/views/settings/general/components/settings_tokens.dart';
import 'package:swanlife/app/ui/widgets/custom_text_widget.dart';
import 'package:swanlife/app/ui/widgets/switch_widget.dart';

class SettingsToggleTile extends StatelessWidget {
  const SettingsToggleTile({
    super.key,
    this.icon,
    this.iconPath,
    this.iconHeight = 18,
    this.iconWidth = 18,
    required this.label,
    required this.value,
    required this.onChanged,
  }) : assert(
         icon != null || iconPath != null,
         'Either icon or iconPath must be provided',
       );

  final IconData? icon;
  final String? iconPath;
  final String label;
  final bool value;
  final double iconHeight;
  final double iconWidth;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            iconPath != null
                ? SvgPicture.asset(
                    iconPath!,
                    width: iconWidth.sp,
                    height: iconHeight.sp,
                    colorFilter: ColorFilter.mode(
                      SettingsTokens.getIconColor(context),
                      BlendMode.srcIn,
                    ),
                  )
                : Icon(icon!, size: 24, color: SettingsTokens.getIconColor(context)),
            const SizedBox(width: 14),
            Expanded(
              child: CustomTextWidget(
                text: label,
                style: GoogleFonts.manrope(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                  color: SettingsTokens.getTileLabelColor(context),
                  height: 1.2,
                ),
              ),
            ),
            SwitchWidget(value: value, onChanged: onChanged),
          ],
        ),
      ),
    );
  }
}
