import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/auth/views/app_success_screen.dart';
import 'package:annale_driver/modules/rides/controllers/review_controller.dart';
import 'package:annale_driver/modules/rides/widgets/star_rating_widget.dart';
import 'package:annale_driver/widgets/app_normal_appbar.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:annale_driver/widgets/app_button.dart';

class ReviewScreen extends StatelessWidget {
  final controller = Get.put(ReviewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNormalAppBar(title: "Add Review"),
      body: Padding(
        padding: AppSpacing.screenPadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: "User Behaviors".tr,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.h),
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green.shade900),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Obx(
                  () => StarRatingWidget(
                    selectedStars: controller.driverRating.value,
                    onStarSelected: controller.setDriverRating,
                  ),
                ),
              ),

              AppSpacing.height30,
              AppText(
                text: "Write Overall Experience".tr,
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
                    hintText: "Write here...".tr,
                  ),
                ),
              ),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.all(22.r),
        child: AppButton(
          text1: 'Submit'.tr,
          callback: () {
            Get.to(
              AppSuccessScreen(
                showMessage: false,
                bgColorGreen: true,
                btnText: "Go Online",
                title: "Ratings & Reviews Submitted successfully",
                subtitle:
                    "Don’t worry, we’ll let you know if there’s a problem with your account",
              ),
            );
          },
        ),
      ),
    );
  }
}
