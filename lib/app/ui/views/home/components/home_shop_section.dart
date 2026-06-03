// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class HomeShopSection extends StatelessWidget {
//   const HomeShopSection({super.key, required this.onLetsGo});

//   final VoidCallback onLetsGo;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 20.w),
//       child: GestureDetector(
//                 onTap: (){},

//         child: Image.asset("assets/images/card2.png")),

//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeShopSection extends StatelessWidget {
  const HomeShopSection({super.key, required this.onLetsGo});

  final VoidCallback onLetsGo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0XFFFFF1ED),

          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 32.h,
          ).copyWith(left: 18.w, right: 6.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFFBE8CC),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Text(
                  'MASTERCLASS',
                  style: GoogleFonts.manrope(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                    color: const Color(0xFF735C00),
                  ),
                ),
              ),
              SizedBox(height: 18.h),
              Text(
                'SWANLIFE AUDIO BLOG',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1A1A1A),
                  height: 1.1,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                'A 15-minute audio session on cultivating the frequency of abundance through intentional surroundings.',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF4E4542),
                  height: 1.55,
                ),
              ),
              SizedBox(height: 18.h),
              InkWell(
                onTap: onLetsGo,
                child: Text(
                  'LISTEN NOW',
                  style: GoogleFonts.manrope(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                    color: const Color(0xFF735C00),
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
