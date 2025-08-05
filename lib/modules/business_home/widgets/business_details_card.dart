import 'package:annale_driver/core/values/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:annale_driver/core/theme/app_gradient.dart';
import 'package:annale_driver/core/values/app_fonts.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/widgets/app_text.dart';

class BusinessDetailsCard extends StatelessWidget {
  final String companyLogoAsset;
  final String companyName;
  final bool isVerified;
  final int totalTrips;
  final int totalBikes;
  final String joinedDate;

  const BusinessDetailsCard({
    super.key,
    required this.companyLogoAsset,
    required this.companyName,
    this.isVerified = true,
    required this.totalTrips,
    required this.totalBikes,
    required this.joinedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppRadius.r16,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5.r),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Top Section
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.md,
            ),
            decoration: BoxDecoration(
              gradient: AppGradients.green,
              borderRadius: AppRadius.r16.copyWith(
                bottomLeft: Radius.zero,
                bottomRight: Radius.zero,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 40.r,
                  height: 40.r,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        offset: Offset(0, 2.r),
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage(companyLogoAsset),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                AppSpacing.width16,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: companyName,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      AppSpacing.height4,
                      Row(
                        children: [
                          AppText(
                            text: "Company",
                            fontSize: 14,
                            color: Colors.white,
                          ),
                          if (isVerified) AppSpacing.width4,
                          if (isVerified)
                            Icon(
                              Icons.check_circle,
                              color: Colors.white,
                              size: 20,
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AppText(
                      text: "Total Trips",
                      fontSize: 14,
                      color: Colors.white,
                    ),
                    AppText(
                      text: "($totalTrips)",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Bottom Section
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.md,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: AppRadius.r16.copyWith(
                topLeft: Radius.zero,
                topRight: Radius.zero,
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(-1, -1),
                  blurRadius: 4,
                  spreadRadius: 0,
                  color: Colors.grey,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Total Bikes
                Row(
                  children: [
                    Image.asset(AppImages.QR, height: 30.r, width: 30.r),
                    AppSpacing.width16,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: "Total Bikes",
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        AppText(
                          text: "$totalBikes",
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ],
                ),
                // Joined Date
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AppText(
                          text: "Joined",
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        AppText(
                          text: joinedDate,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    AppSpacing.width16,
                    Image.asset(AppImages.aBank, height: 30.r, width: 30.r),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
