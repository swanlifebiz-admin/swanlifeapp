import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/controllers/login_controller.dart';
import 'package:swanlife/app/ui/theme/app_colors.dart';
import 'package:swanlife/app/routes/app_routes.dart';
import 'package:swanlife/app/ui/widgets/custom_text_widget.dart';
import 'package:swanlife/app/ui/widgets/primary_button.dart';
import 'package:swanlife/gen/assets.gen.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40.h),
                child: Center(
                  child: Assets.images.primary.image(
                    height: 120.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: CustomTextWidget(
                  text: 'Welcome Back',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.loginTextDark,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 6.h),
                child: CustomTextWidget(
                  text: 'RETURN TO YOUR SANCTUARY',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14.sp,
                    letterSpacing: 2.5,
                    color: AppColors.loginTextMuted,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 32.h, left: 24.w, right: 24.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextWidget(
                    text: 'EMAIL ADDRESS',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 12.sp,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600,
                      color: AppColors.loginTextDark,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: TextField(
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: GoogleFonts.manrope(
                    fontSize: 15.sp,
                    color: AppColors.loginTextDark,
                  ),
                  decoration: InputDecoration(
                    hintText: 'curator@swanlife.com',
                    hintStyle: GoogleFonts.plusJakartaSans(
                      fontSize: 15.sp,
                      color: AppColors.loginTextMuted.withValues(alpha: 0.6),
                    ),
                    filled: false,
                    contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFD5C5C5)),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.loginGoldStart,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 20.h, left: 24.w, right: 24.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextWidget(
                    text: 'PASSWORD',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 12.sp,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600,
                      color: AppColors.loginTextDark,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Obx(
                  () => TextField(
                    controller: controller.passwordController,
                    obscureText: controller.obscurePassword.value,
                    enabled: true,
                    style: GoogleFonts.manrope(
                      fontSize: 14.sp,
                      color: AppColors.loginTextDark,
                    ),
                    decoration: InputDecoration(
                      hintText: '● ● ● ● ● ● ● ●',
                      hintStyle: TextStyle(
                        color: const Color(0xFFD5C5C5),
                        fontSize: 12.sp,
                        letterSpacing: 2.0,
                      ),
                      filled: false,
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.obscurePassword.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: AppColors.loginTextMuted,
                          size: 20.sp,
                        ),
                        onPressed: controller.togglePasswordVisibility,
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFD5C5C5)),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      disabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.loginGoldStart,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 20.h, left: 24.w, right: 24.w),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {},
                    child: CustomTextWidget(
                      text: 'Forgot Password?',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 40.h, left: 24.w, right: 24.w),
                child: Obx(
                  () => PrimaryButton(
                    text: "Enter The Sanctuary",
                    isLoading: controller.isLoading.value,
                    onTap: () => controller.login(),
                  ),
                ),
              ),
              Container(
                color: AppColors.textHint,
                height: 1.h,
                width: 50.w,
                margin: EdgeInsets.only(top: 45.h),
              ),

              Padding(
                padding: EdgeInsets.only(top: 20.h, bottom: 32.h),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14.sp,
                        color: AppColors.loginTextMuted,
                      ),
                      children: [
                        const TextSpan(text: 'New to the archive? '),
                        TextSpan(
                          text: '  Create Account',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.loginTextDark,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(Routes.SIGNUP);
                            },
                        ),
                      ],
                    ),
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
