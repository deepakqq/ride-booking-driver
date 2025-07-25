import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/auth/widgets/auth_header.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTypeScreen extends StatelessWidget {
  const ProfileTypeScreen({Key? key}) : super(key: key);

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
                title: "Select Your Profile Type",
                subTitle:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
              ),
              SizedBox(height: 30.h),

              SizedBox(height: 40.h),
              AppButton(
                text1: "Next",
                callback: () {
                  // Get.to(() => VerificationScreen());
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
