import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:annale_driver/core/theme/app_gradient.dart';
import 'package:annale_driver/core/values/app_fonts.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'package:annale_driver/widgets/app_text.dart';

class DriverCard extends StatelessWidget {
  final String profileImage;
  final String driverName;
  final String phoneNumber;
  final String email;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onViewEarning;
  final VoidCallback? onTrack;

  const DriverCard({
    super.key,
    required this.profileImage,
    required this.driverName,
    required this.phoneNumber,
    required this.email,
    this.onEdit,
    this.onDelete,
    this.onViewEarning,
    this.onTrack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      width: double.infinity,
      padding: EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.greenDarkBg1,
        borderRadius: AppRadius.r16,
        border: Border.all(color: Colors.black, width: .3),
      ),
      child: Column(
        children: [
          // Top Section: Profile, Details, Icons
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Image
              CircleAvatar(
                radius: 40.r,
                backgroundImage: AssetImage(profileImage),
              ),
              AppSpacing.width16,
              // Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          text: driverName,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: onEdit,
                              child: Icon(
                                Icons.edit_outlined,
                                color: Colors.white,
                                size: AppFonts.size20,
                              ),
                            ),
                            AppSpacing.width8,
                            GestureDetector(
                              onTap: onDelete,
                              child: Icon(
                                Icons.delete_outline,
                                color: Colors.white,
                                size: AppFonts.size20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    AppSpacing.height4,
                    AppText(
                      text: phoneNumber,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                    AppSpacing.height4,
                    AppText(text: email, fontSize: 14, color: Colors.white),
                  ],
                ),
              ),
            ],
          ),
          AppSpacing.height16,
          // Bottom Section: Buttons
          Row(
            children: [
              Expanded(
                child: AppButton(
                  text1: "View Earning",
                  callback: onViewEarning,

                  radius: 20.r,
                  height: 45.h,
                  fontSize: 14,
                ),
              ),
              AppSpacing.width16,
              Expanded(
                child: AppButton(
                  fontSize: 14,
                  text1: "Track",
                  callback: onTrack,

                  radius: 20.r,
                  height: 45.h,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
