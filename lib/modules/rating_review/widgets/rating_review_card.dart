import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/theme/app_gradient.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/home/widgets/show_rating_star.dart';
import 'package:annale_driver/modules/rides/views/review_screen.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:annale_driver/widgets/ride/ride_action_bar.dart';
import 'package:annale_driver/widgets/ride/ride_location_tag.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RatingReviewCard extends StatelessWidget {
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
  final showSmallForRating;

  const RatingReviewCard({
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
    this.showSmallForRating = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            // height: 80.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: dateTime,
                  fontSize: 12.sp,
                  color: Colors.white,
                  height: 1,
                ),
                AppSpacing.height8,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(driverImage),
                        radius: 23.r,
                      ),
                    ),
                    AppSpacing.width8,
                    AppText(
                      text: title,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                      fontSize: 12.sp,
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
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    AppText(
                      text: "Driver Behaviors",
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: Colors.white,
                    ),
                    AppSpacing.height4,
                    Align(
                      child: ShowRatingStar(
                        rating: "4.5",
                        showSmall: showSmallForRating,
                      ),
                      alignment: Alignment.bottomCenter,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    AppText(
                      color: Colors.white,
                      text: "Car Condition",
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                    ),
                    AppSpacing.height4,
                    Align(
                      child: ShowRatingStar(
                        rating: "4.5",
                        showSmall: showSmallForRating,
                      ),
                      alignment: Alignment.bottomCenter,
                    ),
                  ],
                ),
              ),
            ],
          ),
          AppSpacing.height14,
          AppText(
            text: "Overall Exprience",
            fontSize: 12.sp,
            color: Colors.white,
          ),
          AppSpacing.height4,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 50.h,
            decoration: BoxDecoration(
              borderRadius: AppRadius.r12,
              color: Colors.white,
            ),
            width: Get.width,
            alignment: Alignment.centerLeft,
            child: AppText(
              text: "Good",
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
