import 'package:annale_driver/core/values/app_redius.dart';
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
        borderRadius: AppRadius.r8,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
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

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: "Ola Electric",
                    fontSize: AppFonts.size18,
                    fontWeight: FontWeight.bold,
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16.sp),
                      AppSpacing.width4,
                      AppText(text: "$rating ★", fontSize: AppFonts.size14),
                    ],
                  ),
                  AppSpacing.height4,
                  AppText(
                    text: ownerName,
                    fontSize: AppFonts.size12,
                    color: Colors.grey[600],
                  ),
                ],
              ),
            ],
          ),

          AppSpacing.height12,

          // Vehicle info row
          Row(
            children: [
              Icon(Icons.electric_car, size: 18.sp, color: Colors.green),
              AppSpacing.width8,
              AppText(text: vehicleType, fontSize: AppFonts.size14),
              AppSpacing.width16,
              Icon(Icons.person_outline, size: 18.sp),
              AppSpacing.width8,
              AppText(
                text: "$passengerCapacity Passenger",
                fontSize: AppFonts.size14,
              ),
            ],
          ),

          AppSpacing.height12,

          // See Details button
          GestureDetector(
            onTap: onSeeDetails,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    text: "See Details",
                    fontSize: AppFonts.size14,
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                  AppSpacing.width4,
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14.sp,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
