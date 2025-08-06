import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/core/values/app_fonts.dart';
import 'package:get/get.dart';

class VehicleInfoCard extends StatelessWidget {
  final double rating;
  final String ownerName;
  final String vehicleType;
  final int passengerCapacity;
  final VoidCallback onSeeDetails;

  const VehicleInfoCard({
    super.key,
    required this.rating,
    required this.ownerName,
    required this.vehicleType,
    required this.passengerCapacity,
    required this.onSeeDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  Row(
                    children: [
                      AppText(
                        text: "$rating",
                        fontSize: AppFonts.size12,
                        color: Colors.grey,
                      ),
                      AppSpacing.width4,
                      Icon(Icons.star, color: Colors.amber, size: 18.sp),
                    ],
                  ),
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
          AppButton(
            callback: onSeeDetails,
            height: 45.h,
            fontSize: 14.sp,
            text1: "See Details",
          ),
        ],
      ),
    );
  }
}
