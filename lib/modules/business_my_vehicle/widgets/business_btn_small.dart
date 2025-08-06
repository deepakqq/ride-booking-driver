import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/theme/app_gradient.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BusinessBtnSmall extends StatelessWidget {
  final bool borderButton;
  final String title;
  final VoidCallback? onTap;
  const BusinessBtnSmall({
    Key? key,
    this.onTap,
    this.title = "",
    this.borderButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: borderButton ? 37.h : 38.h,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 6.h),
        decoration: BoxDecoration(
          border: borderButton
              ? Border.all(color: AppColors.greenDarkBg1)
              : null,
          gradient: borderButton ? null : AppGradients.green,
          borderRadius: AppRadius.r12,
        ),
        child: AppText(
          text: title,
          fontSize: 14,
          color: borderButton ? AppColors.greenDarkBg1 : Colors.white,
        ),
      ),
    );
  }
}
