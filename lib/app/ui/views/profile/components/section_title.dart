import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Text(
      title,
      style: GoogleFonts.plusJakartaSans(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: scheme.onSurface,
      ),
    );
  }
}
