import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/controllers/signup_controller.dart';
import 'package:swanlife/app/ui/theme/app_colors.dart';
import 'package:swanlife/app/ui/views/auth/signup/components/signup_create_account_header.dart';
import 'package:swanlife/app/ui/views/auth/signup/components/signup_hero_section.dart';
import 'package:swanlife/app/ui/views/auth/signup/components/signup_terms_row.dart';
import 'package:swanlife/app/ui/views/auth/signup/components/signup_underline_field.dart';
import 'package:swanlife/app/ui/widgets/custom_text_widget.dart';

import '../../../../routes/app_routes.dart';
import '../../../widgets/primary_button.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SignupHeroSection(),
              const SignupCreateAccountHeader(),
              SignupUnderlineField(
                label: 'FULL NAME',
                labelTopSpacing: 20,
                controller: controller.nameController,
                hint: 'curator',
                textCapitalization: TextCapitalization.words,
              ),
              SignupUnderlineField(
                label: 'EMAIL ADDRESS',
                controller: controller.emailController,
                hint: 'curator@swanlife.com',
                keyboardType: TextInputType.emailAddress,
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

              Obx(
                () => SignupTermsRow(
                  value: controller.acceptTerms.value,
                  onChanged: (v) => controller.acceptTerms.value = v ?? false,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25.h, left: 24.w, right: 24.w),
                child: Obx(
                  () => PrimaryButton(
                    text: "Join Swanlife",
                    isLoading: controller.isLoading.value,
                    onTap: () => controller.signup(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25.h, bottom: 32.h),
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
                          text: '  Login',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.loginTextDark,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(Routes.LOGIN);
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
