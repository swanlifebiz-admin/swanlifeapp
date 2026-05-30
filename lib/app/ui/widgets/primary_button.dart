import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/ui/theme/app_colors.dart';
import 'package:swanlife/app/ui/widgets/custom_text_widget.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final bool? isImage;
  final String? image;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final Color? color;
  final Color? textColor;
  final Color? splashColor;
  final Color? highlightColor;
  final bool isLoading;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width,
    this.height,
    this.color,
    this.image,
    this.isImage,
    this.textColor,
    this.splashColor,
    this.highlightColor,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: GestureDetector(
        onTap: isLoading ? null : onTap,
        child: Container(
          width: width ?? double.infinity,
          height: height ?? 50.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(100.r),
            boxShadow: [
              BoxShadow(
                color: (color ?? AppColors.primary).withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Center(
            child: isLoading
                ? SizedBox(
                    height: 20.h,
                    width: 20.h,
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isImage == true && image != null)
                        Padding(
                          padding: EdgeInsets.only(right: 8.w),
                          child: Image.asset(image!, height: 20.h),
                        ),
                      CustomTextWidget(
                        text: text,
                        style: GoogleFonts.plusJakartaSans(
                          color: textColor ?? Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
