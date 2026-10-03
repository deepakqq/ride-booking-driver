import 'package:annale_driver/core/model/app_success_screen_arg.dart';
import 'package:annale_driver/core/routes/app_routes.dart';
import 'package:annale_driver/modules/auth/controllers/auth_controller.dart';
import 'package:annale_driver/modules/auth/widgets/auth_header.dart';
import 'package:annale_driver/modules/auth/widgets/otp_text_field.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VerificationScreen extends StatefulWidget {
  final VoidCallback? onVerificationSuccess;
  const VerificationScreen({super.key, this.onVerificationSuccess});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            children: [
              AuthHeader(
                showBackBtn: true,
                titleBig: false,
                title: "Enter Verification Code".tr,
                subTitle:
                    "We have sent the code verification to your\nemail address"
                        .tr,
              ),
              SizedBox(height: 30.h),
              OtpTextField(),
              SizedBox(height: 40.h),
              AppButton(
                text1: "Verify".tr,
                callback: () {
                  if (authController.signUp == true) {
                    Get.toNamed(AppRoutes.profileType);
                    authController.signUp.value = false;
                  } else {
                    Get.toNamed(
                      AppRoutes.appSuccess,
                      arguments: AppSuccessScreenArg(btnText: "Back to Log in"),

                      // arguments: {"btnText": "Back to Log in"},
                    );
                  }
                },
                // callback: widget.onVerificationSuccess,
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
