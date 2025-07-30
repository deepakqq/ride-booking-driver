import 'package:annale_driver/modules/auth/views/app_success_screen.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            padding: EdgeInsets.all(16.w),
            children: [
              SizedBox(height: 24.h),
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
                  Get.to(() => AppSuccessScreen());
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
