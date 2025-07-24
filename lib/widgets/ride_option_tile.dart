import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/theme/app_gradient.dart';
import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RideOptionTile extends StatelessWidget {
  final String title;
  final String number;
  final String imagePath;
  final VoidCallback onTap;
  final bool showMin;
  final bool isSelected;

  const RideOptionTile({
    Key? key,
    required this.title,
    required this.number,
    required this.onTap,
    this.isSelected = false,
    this.showMin = false,
    this.imagePath = 'assets/images/bike1.png', // default image path
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xffE5E6E5) : Colors.white,

          border: Border(
            bottom: BorderSide(color: AppColors.primaryDark, width: 1.0),
          ),
        ),
        child: Row(
          children: [
            Image.asset(imagePath, height: 40.h, width: 40.h),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: title,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  AppText(
                    text: number,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade700,
                  ),
                ],
              ),
            ),
            if (!showMin)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Colors.green.shade900,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Row(
                  children: [
                    // Icon(Icons.star, color: Colors.amber, size: 16.sp),
                    Image.asset(AppImages.iconRideStar, height: 14.r),
                    SizedBox(width: 4.w),
                    AppText(
                      text: "4.4",
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
