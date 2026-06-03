// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class HomeLifestyleLivingSection extends StatelessWidget {
//   const HomeLifestyleLivingSection({super.key, required this.onStart});

//   final VoidCallback onStart;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 20.w),
//       child:  GestureDetector(
//         onTap: (){},
//         child: Image.asset("assets/images/card3.png")),

//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeLifestyleLivingSection extends StatelessWidget {
  const HomeLifestyleLivingSection({super.key, required this.onStart});

  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        height: 200.h,
        width: double.infinity,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: const Color(0xFFFFF1ED),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 6.w,
                decoration: BoxDecoration(
                  color: const Color(0xFF735C00),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14.r),
                    bottomLeft: Radius.circular(14.r),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(28.w, 26.h, 28.w, 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Lifestyle Living',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1A1A1A),
                          height: 1.2,
                        ),
                      ),
                      SizedBox(height: 22.h),
                      Text(
                        'Your weekly audit of energy and assets is ready for review.',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF5C4A3A),
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: 18.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: onStart,
                            child: Container(
                              height: 48.h,
                              width: 150.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.r),
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                  width: 1,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'START AUDIT',
                                  style: GoogleFonts.manrope(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1.8,
                                    color: const Color(0xFF1A1A1A),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
