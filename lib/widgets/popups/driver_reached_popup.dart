import 'package:annale_driver/core/values/app_images.dart';

import 'package:annale_driver/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DriverReachedPopup extends StatelessWidget {
  final String otp;
  const DriverReachedPopup({Key? key, required this.otp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // HomeController controller = Get.find();
    List<String> otpDigits = otp.split('');

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 28.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(color: Colors.green, width: 4.w),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.pBike, height: 100.h), // ✅ your top image

            Text(
              "Rider Reached\nto you.".tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 34.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                height: 1.1,
              ),
            ),
            SizedBox(height: 16.h),

            Text(
              "Share This OTP with Cab\nDriver and start the ride.".tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.black,
                height: 1.5,
              ),
            ),
            SizedBox(height: 16.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16.w,
              children: otpDigits.map((digit) {
                return Container(
                  width: 44.w,
                  height: 44.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFF214F2D),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    digit,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16.h),

            AppButton(
              text1: "Pay Before Ride".tr,
              fontSize: 14.sp,
              height: 45.h,
              width: Get.width * .5,
            ),

            SizedBox(height: 16.h),

            GestureDetector(
              onTap: () {
                // Handle Pay After Ride
                Get.back();
                // controller.showDestinationReachedDialog();
              },
              child: Text(
                "Pay After Ride".tr,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
