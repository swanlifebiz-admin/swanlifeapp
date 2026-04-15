import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/gen/assets.gen.dart';

class HomeHeroCard extends StatelessWidget {
  const HomeHeroCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset("assets/images/pic.png", fit: BoxFit.cover),
            // Assets.images.pic.image(fit: BoxFit.cover),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.0),
                    Colors.black.withValues(alpha: 0.2),
                  ],
                  stops: const [0.25, 1.0],
                ),
              ),
            ),
            // Positioned(
            //   left: 18.w,
            //   right: 18.w,
            //   bottom: 20.h,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       Text(
            //         '\u201C',
            //         style: GoogleFonts.playfairDisplay(
            //           fontSize: 32.sp,
            //           color: Colors.white.withValues(alpha: 0.6),
            //           height: 0.6,
            //         ),
            //       ),
            //       SizedBox(height: 2.h),
            //       Text(
            //         'I am the architect of\nmy own light; I design\nmy world with grace.',
            //         style: GoogleFonts.playfairDisplay(
            //           fontSize: 16.sp,
            //           fontWeight: FontWeight.w600,
            //           color: Colors.white,
            //           height: 1.4,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
