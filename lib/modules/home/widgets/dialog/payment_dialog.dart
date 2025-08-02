import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/theme/app_gradient.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart'; // Lottie पैकेज इम्पोर्ट करें

class CardPaymentDialog extends StatelessWidget {
  final String amount;
  final VoidCallback onDone;
  final String? cardReaderImagePath; // Image path can be null
  final String? lottieAssetPath; // Lottie path can be null
  final String title;
  final String btnText;

  const CardPaymentDialog({
    super.key,
    this.amount = "",
    required this.onDone,
    this.cardReaderImagePath,
    this.lottieAssetPath,
    this.title = "",
    this.btnText = "change",
  });

  @override
  Widget build(BuildContext context) {
    // Determine which widget to show

    return AlertDialog(
      contentPadding: EdgeInsets.all(0),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: AppRadius.r16),
      content: Container(
        height: Get.height * .47,
        // width: Get.width - 60,
        child: Stack(
          children: [
            AppSpacing.height8,
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: AppText(
                  text: title,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  align: TextAlign.center,
                  color: Colors.black,
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(bottom: 30.h),
                width: Get.width,
                // color: Colors.amber,
                child: Lottie.asset(
                  lottieAssetPath!,

                  repeat: true,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.credit_card_outlined,
                      size: 100.r,
                      color: Colors.grey,
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 80.h),
                child: AppText(
                  text: amount,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryDark,
                  align: TextAlign.center,
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: AppButton(
                  text1: "Done",
                  callback: onDone,
                  radius: AppRadius.r12.bottomLeft.x,
                  gradient: AppGradients.green,
                ),
              ),
            ),
            AppSpacing.height16,
          ],
        ),
      ),
    );
  }
}

class CashPaymentDialog extends StatelessWidget {
  final String amount;
  final VoidCallback onDone;
  final String? cardReaderImagePath; // Image path can be null
  final String? lottieAssetPath; // Lottie path can be null
  final String title;

  const CashPaymentDialog({
    super.key,
    this.amount = "",
    required this.onDone,
    this.cardReaderImagePath,
    this.lottieAssetPath,
    this.title = "",
  });

  @override
  Widget build(BuildContext context) {
    // Determine which widget to show
    Widget middleWidget;
    if (lottieAssetPath != null && lottieAssetPath!.isNotEmpty) {
      middleWidget = Container(
        child: Lottie.asset(
          lottieAssetPath!,
          width: 140.r,
          height: 150.r,
          fit: BoxFit.contain,
          repeat: true, // Lottie animation loops
          errorBuilder: (context, error, stackTrace) {
            return Icon(
              Icons.credit_card_outlined,
              size: 100.r,
              color: Colors.grey,
            );
          },
        ),
      );
    } else {
      middleWidget = Image.asset(
        cardReaderImagePath!,
        height: 150.h,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Icon(
            Icons.credit_card_outlined,
            size: 100.r,
            color: Colors.grey,
          );
        },
      );
    }

    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: AppRadius.r16),
      content: Container(
        width: Get.width - 60,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppSpacing.height8,
            AppText(
              text: title,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              align: TextAlign.center,
              color: Colors.black,
            ),
            AppSpacing.height12,
            amount.isNotEmpty || amount != ""
                ? AppText(
                    text: amount,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryDark,
                    align: TextAlign.center,
                  )
                : SizedBox(),
            // AppSpacing.height16,÷
            middleWidget, // Dynamically show Lottie or Image
            AppSpacing.height16,
            AppButton(
              callback: onDone,
              radius: AppRadius.r12.bottomLeft.x,
              gradient: AppGradients.green,
              text1: "Done",
            ),
            AppSpacing.height16,
          ],
        ),
      ),
    );
  }
}

class QRPaymentDialog extends StatelessWidget {
  final String amount;
  final VoidCallback onDone;
  final String? cardReaderImagePath; // Image path can be null
  final String? lottieAssetPath; // Lottie path can be null
  final String title;

  const QRPaymentDialog({
    super.key,
    this.amount = "",
    required this.onDone,
    this.cardReaderImagePath,
    this.lottieAssetPath,
    this.title = "",
  });

  @override
  Widget build(BuildContext context) {
    // Determine which widget to show
    Widget middleWidget;
    if (lottieAssetPath != null && lottieAssetPath!.isNotEmpty) {
      middleWidget = Container(
        child: Lottie.asset(
          lottieAssetPath!,
          // width: 120.r,
          // height: 120.r,
          fit: BoxFit.contain,
          repeat: true, // Lottie animation loops
          errorBuilder: (context, error, stackTrace) {
            return Icon(
              Icons.credit_card_outlined,
              size: 100.r,
              color: Colors.grey,
            );
          },
        ),
      );
    } else {
      middleWidget = Image.asset(
        cardReaderImagePath!,
        height: 150.h,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Icon(
            Icons.credit_card_outlined,
            size: 100.r,
            color: Colors.grey,
          );
        },
      );
    }

    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: AppRadius.r16),
      content: Container(
        width: Get.width - 60,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppSpacing.height8,
            AppText(
              text: title,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              align: TextAlign.center,
              color: Colors.black,
            ),
            AppSpacing.height12,
            amount.isNotEmpty || amount != ""
                ? AppText(
                    text: amount,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryDark,
                    align: TextAlign.center,
                  )
                : SizedBox(),
            if (cardReaderImagePath != null) AppSpacing.height16,
            middleWidget, // Dynamically show Lottie or Image
            if (cardReaderImagePath != null) AppSpacing.height16,
            AppButton(
              callback: onDone,
              radius: AppRadius.r12.bottomLeft.x,
              gradient: AppGradients.green,
              text1: "Done",
            ),
            AppSpacing.height16,
          ],
        ),
      ),
    );
  }
}
