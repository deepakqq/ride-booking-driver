import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';

Future<void> showSuccessDialog({
  required BuildContext context,
  required String title,
  required String subtitle,
  required VoidCallback onButtonPressed,
  String buttonText = 'Thanks',
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 30.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// ✅ Tick Image
            Container(
              decoration: BoxDecoration(
                color: AppColors.primaryDark.withValues(alpha: .3),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                AppImages.iconRightTick, // ✔️ your success tick
                height: 70.h,
                width: 70.w,
              ),
            ),

            SizedBox(height: 20.h),

            /// ✅ Title
            AppText(
              text: title.tr,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              align: TextAlign.center,
            ),

            SizedBox(height: 8.h),

            /// ✅ Subtitle
            AppText(
              text: subtitle.tr,
              fontSize: 14.sp,
              fontWeight: FontWeight.w300,
              color: Colors.black,
              align: TextAlign.center,
            ),

            SizedBox(height: 24.h),

            /// ✅ Action Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: AppButton(
                text1: buttonText.tr,
                radius: 8.r,
                callback: onButtonPressed,
                fontSize: 14.sp,
                height: 45.h,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
