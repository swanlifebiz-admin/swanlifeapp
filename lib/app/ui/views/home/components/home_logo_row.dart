import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/ui/theme/app_colors.dart';

class HomeLogoRow extends StatelessWidget {
  final String avatarImageUrl;
  final VoidCallback? onNotificationTap;
  final int unreadCount;

  const HomeLogoRow({
    super.key,
    required this.avatarImageUrl,
    this.onNotificationTap,
    this.unreadCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SizedBox(
        height: 36.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: ClipOval(
                child: Image.network(
                  avatarImageUrl,
                  width: 30.h,
                  height: 30.h,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 30.h,
                      height: 30.h,
                      color: AppColors.loginBackground,
                      alignment: Alignment.center,
                      child: Text(
                        'S',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.loginTextDark,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Text(
              'SwanLife',
              style: GoogleFonts.playfairDisplay(
                fontSize: 23.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.loginTextDark,
              ),
            ),
            if (onNotificationTap != null)
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: onNotificationTap,
                  child: Stack(
                    children: [
                      Icon(
                        Icons.notifications_outlined,
                        size: 24.sp,
                        color: AppColors.loginTextDark,
                      ),
                      if (unreadCount > 0)
                        Positioned(
                          right: -2,
                          top: -2,
                          child: Container(
                            padding: EdgeInsets.all(2.r),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            constraints: BoxConstraints(
                              minWidth: 14.r,
                              minHeight: 14.r,
                            ),
                            child: Text(
                              unreadCount > 9 ? '9+' : unreadCount.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
