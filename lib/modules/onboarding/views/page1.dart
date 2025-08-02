import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnboardPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 120.h),
        Image.asset('assets/images/logo_bike.png', height: 80.h),
        SizedBox(height: 20.h),
        AppText(
          text: "Welcome to Ann Ale".tr,
          fontWeight: FontWeight.bold,
          fontSize: 24.sp,
          align: TextAlign.center,
        ),
        SizedBox(height: 8.h),
        AppText(
          text: "The Fastest Bike Ride at Your Fingertips".tr,
          fontSize: 16.sp,
          align: TextAlign.center,
        ),
        SizedBox(height: 30.h),
        Image.asset('assets/images/girl_mobile.png', height: 320.h),
      ],
    );
  }
}
