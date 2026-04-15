import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final String? fontFamily;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;

  /// When true (default), [fontSize] is passed through [ScreenUtil].
  final bool useScreenUtilForFontSize;

  const CustomTextWidget({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.decoration,
    this.fontFamily,
    this.useScreenUtilForFontSize = true,
  });

  @override
  Widget build(BuildContext context) {
    final double? resolvedSize = fontSize == null
        ? null
        : (useScreenUtilForFontSize ? fontSize!.sp : fontSize);

    final String? resolvedFamily =
        (fontFamily != null && fontFamily!.isNotEmpty) ? fontFamily : null;

    return Text(
      text,
      style:
          style ??
          TextStyle(
            color: color,
            fontSize: resolvedSize,
            fontWeight: fontWeight,
            decoration: decoration,
            fontFamily: resolvedFamily,
          ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

class CustomTextStyles {
  static TextStyle heading1 = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle heading2 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle heading3 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle heading4 = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle body = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
  );
  static TextStyle caption = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
  );
  static TextStyle button = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );
}
