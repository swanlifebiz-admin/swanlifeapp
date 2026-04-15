import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class StatsRow extends StatelessWidget {
  final String leftValue;
  final String leftLabel;
  final String rightValue;
  final String rightLabel;

  const StatsRow({
    super.key,
    required this.leftValue,
    required this.leftLabel,
    required this.rightValue,
    required this.rightLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 14.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: _StatColumn(value: leftValue, label: leftLabel),
          ),
          Expanded(
            child: _StatColumn(value: rightValue, label: rightLabel),
          ),
        ],
      ),
    );
  }
}

class _StatColumn extends StatelessWidget {
  final String value;
  final String label;

  const _StatColumn({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.notoSerif(
            fontSize: 31.sp,
            fontWeight: FontWeight.w400,
            color: scheme.onSurface,
            height: 1,
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          label,
          style: GoogleFonts.manrope(
            fontSize: 10.sp,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w400,
            color: scheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
