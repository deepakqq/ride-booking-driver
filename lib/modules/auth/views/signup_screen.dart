import 'package:annale_driver/core/routes/app_routes.dart';
import 'package:annale_driver/modules/auth/controllers/auth_controller.dart';
import 'package:annale_driver/modules/auth/views/login_screen.dart';
import 'package:annale_driver/modules/auth/widgets/app_social_btn.dart';
import 'package:annale_driver/modules/auth/widgets/auth_header.dart';
import 'package:annale_driver/modules/auth/widgets/login_singup_text.dart';
import 'package:annale_driver/modules/auth/widgets/social_login_section.dart';
import 'package:annale_driver/modules/auth/widgets/upload_profile.dart';
import 'package:annale_driver/core/values/app_fonts.dart';
import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:annale_driver/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.h),
                    AuthHeader(
                      title: "Create New Account".tr,
                      subTitle:
                          "Set up your username and password.\nYou can always change it later.",
                    ),
                    // Row(
                    //   children: [
                    //     AppText(
                    //       text: "Upload Profile Picture".tr,
                    //       fontWeight: FontWeight.w500,
                    //     ),
                    //   ],
                    // ),
                    // AppSpacing.height4,
                    // AppImageUploadBox(),
                    AppSpacing.height15,
                    AppTextfield(
                      prefixImagePath: AppImages.iconPerson,
                      hintText: "Jon Doe",
                    ),
                    AppSpacing.height15,
                    AppTextfield(
                      prefixImagePath: AppImages.iconEmail,
                      hintText: "johndoe@gmail.com",
                    ),
                    AppSpacing.height15,
                    AppTextfield(
                      prefixImagePath: AppImages.iconLock,
                      hintText: "* * * * * *",
                      isPassword: true,
                    ),
                    AppSpacing.height15,
                    AppTextfield(
                      prefixImagePath: AppImages.iconLock,
                      hintText: "* * * * * *",
                      isPassword: true,
                    ),

                    SizedBox(height: 16.h),
                    AppButton(
                      text1: "Sign Up".tr,
                      callback: () {
                        authController.signUp.value = true;
                        Get.toNamed(AppRoutes.verifyOtp);
                      },
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoginSingupText(
                    callback: () {
                      Get.offNamed(AppRoutes.login);
                    },
                    firstText: "Already have an account?".tr,
                    secondText: "LOG IN".tr,
                  ),
                ],
              ),
              SizedBox(height: 28.h),
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
                  SocialLoginSection(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
