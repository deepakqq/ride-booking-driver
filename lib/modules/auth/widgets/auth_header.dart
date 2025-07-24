// import 'package:annale_driver/core/values/app_images.dart';
// import 'package:flutter/material.dart';

// class AuthHeader extends StatelessWidget {
//   final String title;
//   final String subTitle;
//   const AuthHeader({
//     Key? key,
//     this.title = "Welcome Back",
//     this.subTitle =
//         "Login or sign up to experience luxury at \nyour fingertips",
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Column(
//       children: [
//         Image.asset(AppImages.logo, width: size.width * .27),
//         Text(
//           title,
//           style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
//         ),
//         Text(
//           subTitle,
//           textAlign: TextAlign.center,
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
//         ),
//       ],
//     );
//   }
// }

import 'package:annale_driver/core/values/app_images.dart';
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
  const AuthHeader({
    Key? key,
    this.title = "Welcome Back",
    this.subTitle =
        "Login or sign up to experience luxury at \nyour fingertips",
    this.showSubtitle = true,
    this.showTitle = true,
    this.showLogo = true,
    this.showBackBtn = false,
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
                onTap: () {
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
        if (showTitle) SizedBox(height: 12.h),
        if (showTitle)
          Text(
            title.tr,
            style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
          ),
        if (showSubtitle) SizedBox(height: 6.h),
        if (showSubtitle)
          Text(
            subTitle.tr,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
          ),
      ],
    );
  }
}
