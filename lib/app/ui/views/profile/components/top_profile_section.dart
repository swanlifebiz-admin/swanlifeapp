import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TopProfileSection extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String subtitle;

  const TopProfileSection({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(22.r),
            child: Image.network(
              imageUrl,
              width: 110.w,
              height: 110.h,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 108.w,
                  height: 124.h,
                  decoration: BoxDecoration(
                    color: scheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(22.r),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.person_outline_rounded,
                    color: scheme.onSurfaceVariant,
                    size: 34.sp,
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 14.h),
          Text(
            name,
            style: GoogleFonts.playfairDisplay(
              fontSize: 31.sp,
              fontWeight: FontWeight.w400,
              color: scheme.onSurface,
              height: 1.1,
            ),
          ),
          SizedBox(height: 7.h),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12.sp,
              letterSpacing: 1.8,
              fontWeight: FontWeight.w600,
              color: scheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
