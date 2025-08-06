import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/theme/app_gradient.dart';
import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/modules/my_vehicle/screens/edit_vehicle_screen.dart';
import 'package:annale_driver/widgets/app_normal_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

import 'package:annale_driver/widgets/app_text.dart';
import 'package:annale_driver/core/values/app_fonts.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/widgets/app_button.dart';

class BusinessVehicleDetailsScreen extends StatelessWidget {
  final String vehicleImagePath;

  const BusinessVehicleDetailsScreen({
    super.key,
    this.vehicleImagePath = 'assets/images/bike-details.png',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppNormalAppBar(title: "Details"),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 80.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 100.h,
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(bottom: 0, child: Container()),
                      Image.asset(
                        vehicleImagePath,
                        fit: BoxFit.contain,
                        height: 150.h,
                        width: Get.width * 0.8,
                      ),
                      Positioned(
                        bottom: 0.h,
                        child: Row(
                          children: [
                            _buildDot(true),
                            AppSpacing.width8,
                            _buildDot(false),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                AppSpacing.height20,
                Divider(color: AppColors.divider),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: "Ola Electric",
                        fontSize: AppFonts.size16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textDark,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => EditVehicleScreen());
                        },
                        child: Image.asset(AppImages.iconEditB, height: 20.h),
                      ),
                    ],
                  ),
                ),
                AppSpacing.height4,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  child: Row(
                    children: [
                      AppText(
                        text: "4.9",
                        fontSize: AppFonts.size14,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                      AppSpacing.width4,
                      Icon(
                        Icons.star_rounded,
                        color: Colors.orange,
                        size: AppFonts.size14,
                      ),

                      AppSpacing.width16,
                      AppText(
                        text: "• 230 (Reviews)",
                        fontSize: AppFonts.size14,
                        color: Colors.grey.shade600,
                      ),
                    ],
                  ),
                ),
                AppSpacing.height20,

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  child: AppText(
                    text: "Description",
                    fontSize: AppFonts.size16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                AppSpacing.height8,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  child: AppText(
                    text:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.",
                    fontSize: AppFonts.size12,
                    color: Colors.grey.shade700,
                    height: 1.2,
                  ),
                ),
                AppSpacing.height20,

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  child: AppText(
                    text: "License Plate Number",
                    fontSize: AppFonts.size16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                AppSpacing.height8,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  child: AppText(
                    text: "BGY-3891",
                    fontSize: AppFonts.size12,
                    color: AppColors.textGrey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                AppSpacing.height20,

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  child: AppText(
                    text: "Specs",
                    fontSize: AppFonts.size16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                AppSpacing.height8,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  child: Row(
                    children: [
                      // _buildSpecCard("Electric", null),
                      AppText(
                        text: "Electric",
                        fontSize: 12.sp,
                        color: AppColors.textGrey,
                      ),
                      AppSpacing.width16,

                      AppText(
                        text: "1 Passenger",
                        fontSize: 12.sp,
                        color: AppColors.textGrey,
                      ),
                    ],
                  ),
                ),
                AppSpacing.height16,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  child: Row(
                    children: [
                      _buildSpecCardWithDescription("Power", "2.8 W", null),
                      AppSpacing.width8,
                      _buildSpecCardWithDescription(
                        "Max Speed",
                        "80 km/h",
                        null,
                      ),
                      AppSpacing.width8,
                      _buildSpecCardWithDescription(
                        "Acceleration",
                        "4.9 sec 0-60 mph",
                        null,
                      ),
                    ],
                  ),
                ),
                AppSpacing.height20,

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  child: AppText(
                    text: "Pricing",
                    fontSize: AppFonts.size16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                AppSpacing.height8,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  child: Row(
                    children: [
                      _buildPricingCard("Hourly", "10:00 HTG"),
                      AppSpacing.width16,
                      _buildPricingCard("Daily", "200.00 HTG"),
                    ],
                  ),
                ),
                AppSpacing.height30,
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: AppSpacing.screenPadding,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: AppRadius.r20.copyWith(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .15),
              offset: Offset(0, -4),
              blurRadius: 5,
            ),
          ],
        ),
        child: AppButton(
          height: 45.h,
          fontSize: 14.sp,
          text1: "Appoint A Driver",
          callback: () {
            print("Goint to");
          },
          gradient: AppGradients.green,
          radius: AppRadius.r12.bottomLeft.x,
        ),
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      width: isActive ? 10.w : 6.w,
      height: 6.h,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey.shade400,
        borderRadius: AppRadius.r4,
      ),
    );
  }

  Widget _buildSpecCardWithDescription(
    String title,
    String value,
    IconData? icon,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
      decoration: BoxDecoration(
        // color: const Color(0xFFE8F5E9),
        borderRadius: AppRadius.r8,
        border: Border.all(color: Colors.green.shade400, width: 1.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(icon, size: AppFonts.size18, color: Colors.black),
            AppSpacing.height4,
          ],
          AppText(
            text: title,
            fontSize: AppFonts.size12,
            color: AppColors.primaryDark,
          ),
          AppText(
            text: value,
            fontSize: AppFonts.size12,
            fontWeight: FontWeight.w200,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  Widget _buildPricingCard(String type, String price) {
    return Container(
      padding: EdgeInsets.only(
        top: 6.h,
        bottom: 6,
        left: AppSpacing.sm,
        right: 20.w,
      ),
      decoration: BoxDecoration(
        // color: const Color(0xFFE8F5E9),
        borderRadius: AppRadius.r8,
        border: Border.all(color: Colors.green.shade400, width: 1.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            text: type,
            fontSize: AppFonts.size12,
            color: AppColors.primaryDark,
          ),
          AppText(
            text: price,
            fontSize: AppFonts.size12,
            fontWeight: FontWeight.w200,
            color: AppColors.textDark,
          ),
        ],
      ),
    );
  }
}
