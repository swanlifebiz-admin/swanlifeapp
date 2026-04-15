import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/ui/views/settings/general/components/settings_tokens.dart';
import 'package:swanlife/app/ui/widgets/custom_text_widget.dart';

class SettingsNavTile extends StatelessWidget {
  const SettingsNavTile({
    super.key,
    this.icon,
    this.iconPath,
    this.iconHeight = 16,
    this.iconWidth = 16,
    required this.label,
    required this.onTap,
  }) : assert(
         icon != null || iconPath != null,
         'Either icon or iconPath must be provided',
       );

  final IconData? icon;
  final String? iconPath;
  final String label;
  final VoidCallback onTap;
  final double iconHeight;
  final double iconWidth;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.black12,
        highlightColor: Colors.black.withValues(alpha: 0.04),
        child: SizedBox(
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
                          SettingsTokens.iconColor,
                          BlendMode.srcIn,
                        ),
                      )
                    : Icon(icon!, size: 24, color: SettingsTokens.iconColor),
                const SizedBox(width: 14),
                Expanded(
                  child: CustomTextWidget(
                    text: label,
                    style: GoogleFonts.manrope(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                      color: SettingsTokens.tileLabelColor,
                      height: 1.2,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  size: 24,
                  color: SettingsTokens.iconColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
