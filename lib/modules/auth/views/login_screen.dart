import 'package:annale_driver/core/routes/app_routes.dart';
import 'package:annale_driver/core/routes/app_routes.dart';
import 'package:annale_driver/modules/auth/widgets/app_social_btn.dart';
import 'package:annale_driver/modules/auth/widgets/auth_header.dart';
import 'package:annale_driver/modules/auth/widgets/login_singup_text.dart';
import 'package:annale_driver/core/values/app_fonts.dart';
import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/modules/auth/widgets/social_login_section.dart';
import 'package:annale_driver/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:annale_driver/modules/dashboard/views/dashboard_screen.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:annale_driver/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            padding: EdgeInsets.all(16.w),
            children: [
              SizedBox(height: 24.h),
              const AuthHeader(),
              SizedBox(height: 30.h),
              AppTextfield(
                prefixImagePath: AppImages.iconEmail,
                hintText: "Enter email".tr,
              ),
              SizedBox(height: 24.h),
              AppTextfield(
                prefixImagePath: AppImages.iconLock,
                hintText: "Enter Password".tr,
                isPassword: true,
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.forgotPassword);
                    },
                    child: AppText(
                      text: "Forgot Password?".tr,
                      color: Color(0xff7990B7),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              AppButton(
                text1: "Login".tr,
                callback: () {
                  Get.offAll(
                    () => DashboardScreen(),
                    binding: DashboardBinding(),
                  );
                },
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoginSingupText(
                    callback: () {
                      Get.offAndToNamed(AppRoutes.register);
                    },
                    firstText: "First time here?".tr,
                    secondText: "SIGN UP".tr,
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(height: 1.h, color: Colors.black),
                      ),
                      SizedBox(width: 16.w),
                      AppText(
                        text: "Or sign in with".tr,
                        fontSize: AppFonts.size14,
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Container(height: 1.h, color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  SocialLoginSection(hPad: false),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
