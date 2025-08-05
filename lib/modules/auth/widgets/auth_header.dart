import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool showSubtitle;
  final bool showTitle;
  final bool showLogo;
  final bool showBackBtn;
  final bool titleBig;
  final VoidCallback? onBackPress;
  const AuthHeader({
    Key? key,
    this.title = "Welcome Back",
    this.subTitle =
        "Login or sign up to experience luxury at \nyour fingertips",
    this.showSubtitle = true,
    this.showTitle = true,
    this.showLogo = true,
    this.showBackBtn = false,
    this.titleBig = true,
    this.onBackPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showBackBtn)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: onBackPress != null
                    ? onBackPress
                    : () {
                        Get.back();
                      },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                  height: 40.h,
                  width: 40.h,
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        showLogo
            ? Image.asset(
                AppImages.logo,
                width: 100.w, // approx .27 of design width
              )
            : SizedBox(height: 65.h),
        // if (showTitle) SizedBox(height: 12.h),s
        if (showTitle)
          AppText(
            text: title.tr,
            fontSize: titleBig ? 26.sp : 20.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: -1,
          ),
        if (showSubtitle) SizedBox(height: 6.h),
        if (showSubtitle)
          AppText(
            text: subTitle.tr,
            align: TextAlign.center,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
            letterSpacing: -.7,
          ),
      ],
    );
  }
}
