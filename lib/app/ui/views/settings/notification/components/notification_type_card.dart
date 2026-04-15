import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/ui/widgets/switch_widget.dart';

class NotificationTypeCard extends StatelessWidget {
  const NotificationTypeCard({
    super.key,
    required this.cardBg,
    required this.accent,
    required this.titleDark,
    required this.subtitleGrey,
    this.icon,
    this.iconPath,
    required this.title,
    required this.description,
    required this.value,
    required this.onChanged,
  });

  final Color cardBg;
  final Color accent;
  final Color titleDark;
  final Color subtitleGrey;
  final IconData? icon;
  final String? iconPath;
  final String title;
  final String description;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          if (iconPath != null)
            SvgPicture.asset(iconPath!, height: 45.sp)
          else
            Icon(icon, size: 28, color: accent),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w400,
                    color: titleDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14.sp,
                    color: subtitleGrey,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding:  EdgeInsets.only(left: 40.w),
            child: SwitchWidget(
              value: value,
              onChanged: onChanged,
              width: 44,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }
}
