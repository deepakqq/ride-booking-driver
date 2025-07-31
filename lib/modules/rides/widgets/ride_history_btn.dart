import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';

class RideHistoryBtn extends StatelessWidget {
  final bool isSelected;
  final String title;
  final VoidCallback? callback;
  const RideHistoryBtn({
    Key? key,
    this.title = "Completed Ride",
    this.isSelected = true,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        alignment: Alignment.center,
        height: 55.h,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Color(0xffD8FFBF),
          border: Border.all(color: AppColors.textDark),
          borderRadius: AppRadius.r20,
        ),
        child: AppText(
          text: title.tr,
          color: isSelected ? Colors.black87 : AppColors.borderBlack,
        ),
      ),
    );
  }
}
