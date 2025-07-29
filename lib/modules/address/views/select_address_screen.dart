import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/widgets/app_normal_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/values/app_spacing.dart';
import '../../../widgets/app_button.dart';

class SelectAddressScreen extends StatelessWidget {
  const SelectAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Stack(
        children: [
          /// 🗺️ Placeholder Map Container
          Container(
            height: Get.height,
            width: Get.width,
            color: Colors.grey.shade300,
            child: Center(
              child: Text(
                "Map".tr,
                style: TextStyle(fontSize: 16, color: Colors.black45),
              ),
            ),
          ),

          /// 📍 Center Pin Placeholder
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 40.h),
              child: Image.asset(AppImages.iconLocationPin, height: 24.h),
            ),
          ),

          /// 🔙 Back Button

          /// ✅ Select Address Button
          Positioned(
            bottom: 32.h,
            left: 16.w,
            right: 16.w,
            child: AppButton(
              text1: "Select Address".tr,
              callback: () {
                Get.back();
              },
            ),
          ),
        ],
      ),
    );
  }
}
