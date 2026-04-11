import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:swanlife/app/controllers/splash_controller.dart';
import '../theme/app_colors.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Dummy Swan Logo Placeholder
            Container(
              width: 150.w,
              height: 150.w,
              decoration: BoxDecoration(
                color: AppColors.secondary.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons
                    .cruelty_free, // Closest to a swan icon in standard material
                size: 80.w,
                color: AppColors.secondary,
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              'SWANLIFE',
              style: context.textTheme.displaySmall?.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
                letterSpacing: 4,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'STAY SERENE',
              style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
