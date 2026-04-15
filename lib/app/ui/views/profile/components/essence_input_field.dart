import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/ui/theme/app_colors.dart';

class EssenceInputField extends StatelessWidget {
  final IconData icon;
  final String label;
  final String hintText;
  final TextEditingController controller;

  const EssenceInputField({
    super.key,
    required this.icon,
    required this.label,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 2.h),
          child: Icon(icon, size: 22.sp, color: scheme.onSurface),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                  color: scheme.onSurface,
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                constraints: BoxConstraints(minHeight: 80.h),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: TextField(
                    controller: controller,
                    minLines: 3,
                    maxLines: null,
                    textAlignVertical: TextAlignVertical.top,
                    style: GoogleFonts.manrope(
                      fontSize: 13.sp,
                      color: scheme.onSurface,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: GoogleFonts.manrope(
                        fontSize: 12.sp,
                        color: scheme.onSurfaceVariant,
                        fontWeight: FontWeight.w300,
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 11.h,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
