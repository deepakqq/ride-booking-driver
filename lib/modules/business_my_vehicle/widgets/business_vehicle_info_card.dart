import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/modules/business_my_vehicle/widgets/business_btn_small.dart';
import 'package:annale_driver/modules/business_my_vehicle/widgets/business_show_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/core/values/app_fonts.dart';
import 'package:get/get.dart';

class BusinessVehicleInfoCard extends StatelessWidget {
  final double rating;
  final String ownerName;
  final String vehicleType;
  final int passengerCapacity;
  final VoidCallback? onSeeDetails;
  final VoidCallback? onAppoint;
  final VoidCallback? onBooking;
  final VoidCallback? onViewEarning;
  final bool driverAssign;

  const BusinessVehicleInfoCard({
    super.key,
    required this.rating,
    required this.ownerName,
    required this.vehicleType,
    required this.passengerCapacity,
    this.onSeeDetails,
    this.onBooking,
    this.onAppoint,
    this.onViewEarning,
    this.driverAssign = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h, left: 22.w, right: 22.w, top: 8.h),
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.lg,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppRadius.r12,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            spreadRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(
            children: [
              Image.asset(
                'assets/images/vehicle-image.png',
                width: Get.width * .3,
              ),
              AppSpacing.width32,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: "Ola Electric",
                    fontSize: AppFonts.size14,
                    fontWeight: FontWeight.bold,
                  ),
                  BusinessShowRating(rating: '4.5'),
                  AppSpacing.height4,
                  AppText(
                    text: ownerName,
                    fontSize: AppFonts.size12,
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),

          AppSpacing.height12,

          // Vehicle info row
          Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: AppText(
                    text: vehicleType,
                    fontSize: AppFonts.size12,
                    color: Colors.grey,
                  ),
                ),
              ),
              // AppSpacing.width16,
              Container(height: 15.h, width: 1, color: Colors.grey),

              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: AppText(
                    text: "$passengerCapacity Passenger",
                    fontSize: AppFonts.size12,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),

          AppSpacing.height12,

          // See Details button
          driverAssign
              ? Row(
                  children: [
                    Expanded(
                      child: BusinessBtnSmall(
                        onTap: onSeeDetails,
                        borderButton: true,
                        title: "Details",
                      ),
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: BusinessBtnSmall(
                        title: "Appoint A Driver",
                        onTap: onAppoint,
                      ),
                    ),
                    AppSpacing.width16,
                    Expanded(
                      child: BusinessBtnSmall(
                        onTap: onSeeDetails,
                        title: "Detail",
                        borderButton: true,
                      ),
                    ),
                  ],
                ),

          if (driverAssign)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSpacing.height16,
                Row(
                  children: [
                    Container(
                      height: 60.h,
                      width: 60.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/user-avatar1.png"),
                          fit: BoxFit.fitHeight,
                        ),
                        borderRadius: AppRadius.medium,
                        color: Colors.grey,
                      ),
                    ),
                    AppSpacing.width10,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: "Subash Bergson",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        BusinessShowRating(rating: "4.5"),
                      ],
                    ),
                  ],
                ),
                AppSpacing.height12,
                Row(
                  children: [
                    Expanded(
                      child: BusinessBtnSmall(
                        title: "View Earning",
                        onTap: onViewEarning,
                      ),
                    ),
                    AppSpacing.width16,
                    Expanded(
                      child: BusinessBtnSmall(
                        onTap: onBooking,
                        title: "View Booking",
                        borderButton: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }
}
