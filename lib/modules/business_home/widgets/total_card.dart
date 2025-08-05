import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalCard extends StatelessWidget {
  final String title;
  final String earningsAmount;
  final String? iconPath;

  const TotalCard({
    super.key,
    required this.title,
    required this.earningsAmount,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 120.w,
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 0.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 5.h),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,

            width: 35.r,
            height: 35.r,
            decoration: BoxDecoration(
              color: const Color(0xFF4CAF50),
              shape: BoxShape.circle,
            ),
            child: iconPath != null
                ? Image.asset(
                    iconPath!,
                    fit: BoxFit.contain,
                    color: Colors.white,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.attach_money_rounded,
                        color: Colors.white,
                        size: 20.r,
                      );
                    },
                  )
                : Icon(
                    Icons.attach_money_rounded,
                    color: Colors.white,
                    size: 20.r,
                  ),
          ),
          AppSpacing.height4,
          Text(
            title,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            earningsAmount,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
