import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReachedDestinationPopup extends StatelessWidget {
  const ReachedDestinationPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 34.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
        side: BorderSide(color: Color(0xFF55DE5D), width: 4),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.pBike, height: 100.h),

            AppText(
              text: "We Reached to\nyour Destination".tr,
              fontSize: 28.sp,
              align: TextAlign.center,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              height: 1.1,
            ),

            SizedBox(height: 32.h),
            AppButton(
              height: 45.h,
              width: Get.width * .5,
              text1: "Pay Now".tr,
              callback: () {
                // Get.back();
                // Get.to(() => SelectCardToPayScreen(payToDriver: true));
              },
              fontSize: 16.sp,
              color: Colors.black,
              // w: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
