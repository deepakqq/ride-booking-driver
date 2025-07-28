import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/theme/app_gradient.dart';
import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'package:annale_driver/widgets/app_normal_appbar.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';

class ReferralsRewardsScreen extends StatelessWidget {
  const ReferralsRewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNormalAppBar(
        title: "Referrals & Rewards",
        screenBGColor: true,
      ),
      backgroundColor: AppColors.screenBG,
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Invite box
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: const Color(0xFF6FC146)),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: 'Invite friends, earn rewards'.tr,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    // SizedBox(height: 8.h),
                    AppText(
                      text:
                          "Share your invite code with friends and family. When they complete their first trip, you'll both earn a reward."
                              .tr,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey[600],
                    ),
                    SizedBox(height: 16.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffE8F9DB),
                        border: Border.all(color: const Color(0xff7BDA40)),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            text: 'AB123ANNALE',
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                          Image.asset(AppImages.iconReferCopy, height: 24.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),

              // Invite Button
              AppButton(text1: "Invite Friends".tr, callback: () {}),
              SizedBox(height: 20.h),

              // Your Rewards Title
              AppText(
                text: "Your rewards".tr,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 12.h),

              // Rewards Container
              Container(
                width: double.infinity,
                // padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff6FC146)),
                  borderRadius: BorderRadius.circular(14.r),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    _RewardTile(
                      iconPath: AppImages.iconReferReward,
                      title: 'Complete 5 trips'.tr,
                      subtitle: 'Earn 12.50 HTG'.tr,
                    ),

                    _RewardTile(
                      iconPath: AppImages.iconReferFriend,
                      title: 'Refer a friend'.tr,
                      subtitle: 'Earn 11.30 HTG'.tr,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RewardTile extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subtitle;

  const _RewardTile({
    required this.iconPath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      child: Row(
        children: [
          Container(
            height: 40.r,
            width: 40.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              gradient: AppGradients.green,
            ),
            child: Image.asset(iconPath),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(text: title, fontWeight: FontWeight.w500),
              AppText(
                text: subtitle,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
