import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/theme/app_gradient.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LogoutDialog extends StatelessWidget {
  final VoidCallback onYesTap;

  const LogoutDialog({super.key, required this.onYesTap});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText(
              text: "Are You Sure Want\nTo Log Out ?".tr,
              align: TextAlign.center,
              height: 1.2,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
            AppSpacing.height30,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Yes Button
                Expanded(
                  child: AppButton(
                    showBorder: true,
                    radius: 8.r,
                    callback: onYesTap,
                    text1: "Yes".tr,
                    height: 45.h,
                    fontSize: 14.sp,
                  ),
                ),

                AppSpacing.width16,

                // No Button
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      side: BorderSide(color: AppColors.primary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    onPressed: () => Get.back(),
                    child: AppText(
                      text: "No".tr,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
