import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/theme/app_gradient.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/rides/views/review_screen.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:annale_driver/widgets/ride/ride_action_bar.dart';
import 'package:annale_driver/widgets/ride/ride_location_tag.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RideCard extends StatelessWidget {
  final String title;
  final String dateTime;
  final String pickup;
  final String drop;
  final String price;
  final String vehicleImage;
  final String driverImage;
  final Widget statusButton;
  final bool track;
  final String status;

  const RideCard({
    super.key,
    required this.title,
    required this.dateTime,
    required this.pickup,
    required this.drop,
    required this.price,
    required this.vehicleImage,
    required this.driverImage,
    required this.statusButton,
    this.status = '',
    this.track = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 8.h),
          padding: EdgeInsets.all(12.h),
          decoration: BoxDecoration(
            color: Color(0xff24422C),
            borderRadius: AppRadius.r12,
            border: Border.all(color: Color(0xff389458)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: dateTime,
                      fontSize: 12.sp,
                      color: Colors.white,
                    ),
                    AppSpacing.height4,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          text: title,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                          fontSize: 12.sp,
                        ),
                      ],
                    ),
                    AppSpacing.height4,
                    if (status != "going")
                      Row(
                        children: [
                          Text(
                            '\$$price',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    AppSpacing.height4,
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: RideLocationTag(text: pickup, color: Colors.red),
                  ),
                  Icon(Icons.arrow_forward, size: 18, color: Color(0xffE7B84C)),
                  Expanded(
                    child: RideLocationTag(text: drop, color: Colors.purple),
                  ),
                ],
              ),
              AppSpacing.height12,
              status == 'going'
                  ? RideActionBar(
                      price: "240.0",
                      buttonText: 'Track'.tr,
                      onPressed: () {},
                    )
                  : status == "canceled"
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 3.h,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xff8D3737),
                            borderRadius: AppRadius.r20,
                          ),
                          child: AppText(
                            text: "Canceled".tr,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (status == "reviewed") {
                                Get.to(() => ReviewScreen());
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.h,
                                vertical: 4.h,
                              ),
                              decoration: BoxDecoration(
                                color: status != "reviewed"
                                    ? Color(0xff37598D)
                                    : null,
                                gradient: status == "reviewed"
                                    ? AppGradients.yello
                                    : null,
                                borderRadius: AppRadius.r20,
                              ),
                              child: Text(
                                status == "reviewed"
                                    ? "Add Review".tr
                                    : " ⭐️⭐️⭐️⭐️ 4 star",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                        AppSpacing.width32,
                        Expanded(
                          child: AppButton(
                            height: 30.h,
                            text1: "Repeat Ride".tr,
                            fontSize: 12.sp,
                            radius: 20.r,
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
        Positioned(
          top: 16.h,
          right: 8.w,
          child: Stack(
            children: [
              Container(width: 129.w, height: 73.h),
              Positioned(
                child: Image.asset(vehicleImage, width: 85.w),
                top: 0,
                left: 0,
              ),
              Positioned(
                child: CircleAvatar(
                  backgroundImage: AssetImage(driverImage),
                  radius: 23.r,
                ),
                top: 8.h,
                right: 8.w,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
