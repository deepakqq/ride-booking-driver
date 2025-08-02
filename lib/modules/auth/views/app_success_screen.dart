import 'package:annale_driver/core/routes/app_routes.dart';
import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/auth/views/login_screen.dart';
import 'package:annale_driver/modules/auth/widgets/auth_header.dart';
import 'package:annale_driver/modules/dashboard/controllers/dashboard_controller.dart';

import 'package:annale_driver/widgets/app_button.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppSuccessScreen extends StatefulWidget {
  final bool showMessage;
  final bool bgColorGreen;
  final String title;
  final String subtitle;
  final String btnText;
  final showRemindMe;
  const AppSuccessScreen({
    super.key,
    this.btnText = "Done",
    this.showMessage = true,
    this.showRemindMe = false,
    this.bgColorGreen = false,
    this.title = "Your Password has changed",
    this.subtitle =
        "Don't worry, we'll let you know if there's a\nproblem with your account",
  });

  @override
  State<AppSuccessScreen> createState() => _AppSuccessScreenState();
}

class _AppSuccessScreenState extends State<AppSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.bgColorGreen
          ? Color.fromARGB(255, 215, 237, 215)
          : Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              SizedBox(height: 12.h),
              const AuthHeader(showSubtitle: false, showTitle: false),
              Image.asset(AppImages.rightTick),
              if (widget.showMessage)
                Image.asset(AppImages.great, height: 40.h),
              if (widget.btnText == "Done")
                AppText(
                  text: "${"Thank You".tr} 🎉",
                  fontSize: 30.h,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primaryDark,
                ),
              AppSpacing.height16,
              AppText(
                text: widget.title.tr,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                align: TextAlign.center,
              ),
              AppSpacing.height16,
              AppText(
                text: widget.subtitle.tr,
                fontWeight: FontWeight.w400,
                fontSize: 13.sp,
                align: TextAlign.center,
              ),
              const Spacer(), // Pushes button to bottom
              AppButton(
                text1: widget.btnText.tr,
                callback: () {
                  if (widget.btnText == "Back to Log in") {
                    Get.offNamed(AppRoutes.login);

                    return;
                  }
                  if (widget.btnText == "Back To Wallet") {
                    Get.back();
                    Get.back();
                    Get.back();
                  }
                  if (widget.btnText == "Done") {
                    Get.back();
                    Get.back();
                  }
                  if (widget.btnText == "Go Online") {
                    Get.back();
                    Get.back();
                  }
                  if (widget.btnText == "Rate Your Ride") {
                    Get.back();
                    Get.back();
                    Get.back();
                    DashboardController dashboardController = Get.find();
                    dashboardController.currentIndex.value = 0;
                    // HomeController homeController = Get.find();
                    // homeController.rideState.value =
                    //     RideFlowState.searchLocation;
                    // homeController.driving.value = false;
                  }
                },
              ),
              SizedBox(height: 24.h),
              if (widget.showRemindMe)
                GestureDetector(
                  onTap: () {
                    Get.back();
                    Get.back();
                    Get.back();
                    DashboardController dashboardController = Get.find();
                    dashboardController.currentIndex.value = 0;
                    // HomeController homeController = Get.find();
                    // homeController.rideState.value =
                    //     RideFlowState.searchLocation;
                    // homeController.driving.value = false;
                  },
                  child: AppText(
                    text: "Remind me later".tr,
                    color: AppColors.primaryDarkBg,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
