import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TopProfileSection extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String subtitle;
  final VoidCallback? onEditPhoto;

  const TopProfileSection({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.subtitle,
    this.onEditPhoto,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Center(
      child: Column(
        children: [
          GestureDetector(
            onTap: onEditPhoto,
            behavior: HitTestBehavior.opaque,
            child: Stack(
              clipBehavior: Clip.none,
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
                        width: 110.w,
                        height: 110.h,
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
                if (onEditPhoto != null)
                  Positioned(
                    bottom: -4.h,
                    right: -4.w,
                    child: Container(
                      padding: EdgeInsets.all(6.w),
                      decoration: BoxDecoration(
                        color: scheme.primary,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.camera_alt_rounded,
                        color: scheme.onPrimary,
                        size: 14.sp,
                      ),
                    ),
                  ),
              ],
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
