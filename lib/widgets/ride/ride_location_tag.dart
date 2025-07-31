import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RideLocationTag extends StatelessWidget {
  final Color color;
  final String text;
  const RideLocationTag({Key? key, this.text = "", required this.color})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.primary,
        // color: color.withOpacity(0.1),
        borderRadius: AppRadius.r8,
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(4.r),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(radius: 5.r, backgroundColor: color),
          ),
          AppSpacing.width4,
          Expanded(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,

              style: TextStyle(
                color: AppColors.textDark,
                fontWeight: FontWeight.bold,
                fontSize: 13.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
