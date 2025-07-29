import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentHistoryTile extends StatelessWidget {
  final String bigText;
  final String iconPath;
  final String smallText;
  const PaymentHistoryTile({
    super.key,
    this.bigText = 'this bigtext',
    this.smallText = 'this smalltext',
    this.iconPath = AppImages.iconRideBike,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.r),
      child: Row(
        children: [
          Container(
            height: 48.h,
            width: 48.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff7BDA40), Color(0xff2D6F3F)],
              ),
              borderRadius: AppRadius.r8,
            ),
            child: Container(
              padding: AppSpacing.paddingAllSM,
              decoration: BoxDecoration(
                color: Color(0xffF2F2F2),
                borderRadius: AppRadius.r8,
              ),
              height: 46.h,
              width: 46.w,
              child: Container(
                alignment: Alignment.center,

                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(iconPath),
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          AppSpacing.width8,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  bigText,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: Color(0xff141414),
                  ),
                ),
              ),
              // SizedBox(height: 2),
              Container(
                child: Text(
                  smallText,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: Color(0xff757575),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
