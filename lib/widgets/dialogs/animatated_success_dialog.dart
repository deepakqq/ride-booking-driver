import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import 'package:annale_driver/widgets/app_text.dart';
import 'package:annale_driver/core/values/app_fonts.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';

class SuccessDialog extends StatelessWidget {
  final String message;
  final String lottieAssetPath;
  final VoidCallback? onDismiss;

  const SuccessDialog({
    super.key,
    required this.message,
    required this.lottieAssetPath,
    this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: AppRadius.r16),
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            "assets/check.json",
            width: 100.r,
            height: 100.r,
            repeat: false,
            fit: BoxFit.contain,
            onLoaded: (composition) {
              Future.delayed(composition.duration * 2, () {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                  onDismiss?.call();
                }
              });
            },
            errorBuilder: (context, error, stackTrace) {
              return Icon(
                Icons.check_circle_outline,
                size: 80.r,
                color: Colors.green,
              );
            },
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: AppText(
              text: message,
              fontSize: AppFonts.size14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              align: TextAlign.center,
            ),
          ),
          AppSpacing.height16,
        ],
      ),
    );
  }
}

void showAnimatadSuccessDialog(
  BuildContext context, {
  required String message,
  required String lottieAssetPath,
  VoidCallback? onDismiss,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return SuccessDialog(
        message: message,
        lottieAssetPath: lottieAssetPath,
        onDismiss: onDismiss,
      );
    },
  );
}
