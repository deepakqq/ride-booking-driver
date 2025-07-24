import 'package:annale_driver/modules/auth/views/signup_screen.dart';
import 'package:annale_driver/modules/auth/views/verification_screen.dart';
import 'package:annale_driver/modules/auth/widgets/auth_header.dart';
import 'package:annale_driver/modules/auth/widgets/login_singup_text.dart';
import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'package:annale_driver/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            padding: EdgeInsets.all(16.w),
            children: [
              // SizedBox(height: 24.h),
              AuthHeader(
                showBackBtn: true,
                showLogo: false,
                title: "Reset Password".tr,
                subTitle:
                    "Please enter your email address. So we'll\nsend you link to get into your account"
                        .tr,
              ),
              SizedBox(height: 30.h),
              AppTextfield(
                prefixImagePath: AppImages.iconEmail,
                hintText: "johndoe@gmail.com",
              ),
              SizedBox(height: 24.h),
              AppTextfield(
                prefixImagePath: AppImages.iconLock,
                hintText: "* * * * * *",
                isPassword: true,
              ),
              SizedBox(height: 24.h),
              AppTextfield(
                prefixImagePath: AppImages.iconLock,
                hintText: "* * * * * *",
                isPassword: true,
              ),

              SizedBox(height: 40.h),
              AppButton(
                text1: "Send Code".tr,
                callback: () {
                  Get.to(() => VerificationScreen());
                },
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
