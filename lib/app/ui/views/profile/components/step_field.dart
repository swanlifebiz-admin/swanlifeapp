import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/ui/theme/app_colors.dart';

class StepField extends StatelessWidget {
  final String step;
  final String title;
  final String? description;
  final TextEditingController controller;
  final IconData trailingIcon;
  final String hintText;
  final bool iconInHeader;
  final bool isEditable;

  const StepField({
    super.key,
    required this.step,
    required this.title,
    this.description,
    required this.controller,
    required this.trailingIcon,
    required this.hintText,
    this.iconInHeader = false,
    this.isEditable = false,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          step,
          style: GoogleFonts.manrope(
            fontSize: 11.sp,
            letterSpacing: 1.4,
            fontWeight: FontWeight.w700,
            color: scheme.onSurfaceVariant,
          ),
        ),
        SizedBox(height: 6.h),
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.manrope(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: scheme.onSurface,
                ),
              ),
            ),
            if (iconInHeader)
              Icon(
                trailingIcon,
                size: 18.sp,
                color: scheme.onSurface,
              ),
          ],
        ),
        if (description != null) ...[
          SizedBox(height: 8.h),
          Text(
            description!,
            style: GoogleFonts.manrope(
              fontSize: 14.sp,
              color: scheme.onSurfaceVariant,
              height: 1.45,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
        SizedBox(height: 10.h),
        Container(
          height: 44.h,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              Expanded(
                child: isEditable
                    ? TextField(
                        controller: controller,
                        textAlignVertical: TextAlignVertical.center,
                        style: GoogleFonts.manrope(
                          fontSize: 12.sp,
                          color: scheme.onSurface,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          hintText: hintText,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          hintStyle: GoogleFonts.manrope(
                            fontSize: 10.sp,
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w300,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 12.h,
                          ),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 12.h,
                        ),
                        child: Text(
                          hintText,
                          style: GoogleFonts.manrope(
                            fontSize: 10.sp,
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
              ),
              if (!iconInHeader)
                Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (Rect bounds) {
                      return AppColors.primaryGradient.createShader(bounds);
                    },
                    child: SizedBox(
                      width: 18.sp,
                      height: 22.sp,
                      child: Icon(
                        trailingIcon,
                        size: 22.sp,
                        color: Colors.white,
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
