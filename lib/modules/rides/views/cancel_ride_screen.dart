import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/rides/controllers/review_controller.dart';
import 'package:annale_driver/widgets/app_normal_appbar.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:annale_driver/widgets/app_button.dart';

class CancelRideScreen extends StatelessWidget {
  final controller = Get.put(ReviewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNormalAppBar(title: "Rate Your Ride".tr),
      body: Padding(
        padding: AppSpacing.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: "Reason to cancel".tr,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.h),
              height: Get.height * .32,
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: const Color(0xff214F2D).withOpacity(0.2),
                border: Border.all(color: const Color(0xff214F2D)),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: TextField(
                maxLines: null,
                onChanged: controller.setExperience,
                decoration: InputDecoration.collapsed(
                  hintText: "Write here....".tr,
                ),
              ),
            ),

            Spacer(),
            AppButton(
              text1: 'Submit'.tr,
              callback: () {
                Get.back();
              },
            ),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}
