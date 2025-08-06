import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/theme/app_container.dart';
import 'package:annale_driver/widgets/app_normal_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';

import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:annale_driver/widgets/app_button.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBG,
      appBar: AppNormalAppBar(title: "Details", screenBGColor: true),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 100.h),
            child: Container(
              margin: EdgeInsets.all(22.r),
              padding: EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: AppRadius.r16,
                // border: Border.all(color: Colors.grey.shade300),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 6,
                    color: Colors.black.withValues(alpha: .1),
                    offset: (Offset(1, 1)),
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/bike-details.png',
                      height: 80.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                  AppSpacing.height16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildInfoColumn(
                        title: "PickUp Location :",
                        value: "SBI Bank, Baner",
                      ),
                      _buildInfoColumn(
                        title: "Drop Location :",
                        value: "Central Park",
                      ),
                    ],
                  ),
                  AppSpacing.height30,
                  _buildTitle("Customer Details:"),
                  _buildSubtitle(subtitle: "Abram Vetrovs", lightColor: true),
                  _buildSubtitle(subtitle: "+91 123456789"),
                  _buildSubtitle(subtitle: "abramvetrovs@gmail.com"),
                  AppSpacing.height30,
                  _buildTitle("Trip Details:"),
                  _buildSubtitle(subtitle: "Royal Enfield", lightColor: true),
                  _buildSubtitle(subtitle: "1 Person"),
                  _buildSubtitle(
                    subtitle: "Start Date : Sat, Dec 5 (02:39 PM)",
                  ),
                  _buildSubtitle(subtitle: "End Date : Sat, Dec 5 (02:49 PM)"),
                  AppSpacing.height30,
                  _buildTitle("Payment Details"),
                  _buildSubtitle(
                    subtitle: "281.00 HTG",
                    big: true,
                    lightColor: true,
                  ),
                  _buildSubtitle(subtitle: "Payment method: Card"),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          bottom: 50.h,
          left: 22.w,
          right: 22.w,
          top: 20.h,
        ),

        child: AppButton(text1: "Download Invoice"),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: title,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        AppSpacing.height8,
      ],
    );
  }

  Widget _buildSubtitle({
    bool big = false,
    bool lightColor = false,
    required String subtitle,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: AppSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: subtitle,
            fontSize: big
                ? 18
                : lightColor
                ? 16.0
                : 14,
            fontWeight: lightColor ? FontWeight.w700 : FontWeight.w500,
            color: lightColor ? AppColors.textGrey : Colors.grey,
          ),
          AppSpacing.height4,
        ],
      ),
    );
  }

  Widget _buildInfoColumn({required String title, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: title,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        AppSpacing.height4,
        AppText(
          text: value,
          fontSize: 16.0,
          color: AppColors.textGrey,
          fontWeight: FontWeight.w700,
        ),
      ],
    );
  }
}
