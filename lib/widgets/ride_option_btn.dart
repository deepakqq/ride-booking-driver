import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RdieOtionBtn extends StatelessWidget {
  final VoidCallback? callback;
  final String btnTitle;
  final Color bgColor;
  const RdieOtionBtn({
    Key? key,
    this.btnTitle = "",
    this.callback,
    this.bgColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        alignment: Alignment.center,
        height: 50.h,
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: AppColors.primary),
          borderRadius: AppRadius.r18,
        ),
        child: AppText(
          text: btnTitle,
          fontSize: 14.sp,
          color: AppColors.primaryDark,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
