import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/account/widgets/account_text_field.dart';
import 'package:annale_driver/modules/account/widgets/dropdown_widget.dart';
import 'package:annale_driver/modules/account/widgets/small_ride_container.dart';

import 'package:annale_driver/widgets/app_button.dart';
import 'package:annale_driver/widgets/app_normal_appbar.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBG,
      appBar: AppNormalAppBar(title: "Edit Profile", screenBGColor: true),
      body: ListView(
        padding: AppSpacing.screenPadding,
        children: [
          SizedBox(height: 20.h),
          Center(
            child: Container(
              alignment: Alignment.center,
              height: 120.h,
              width: 120.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,

                image: DecorationImage(
                  image: AssetImage(AppImages.accountProfile),
                  fit: BoxFit.cover,
                ),
              ),
              child: Image.asset(
                'assets/images/icons/icon-camera.png',

                height: 27.h,
              ),
            ),
          ),
          _heading("Name".tr),
          AppSpacing.height8,
          AccountTextField(hintText: 'John Doe'),
          AppSpacing.height16,
          _heading("Gender".tr),
          AppSpacing.height8,
          DropdownWidget(),
          AppSpacing.height16,
          _heading("Email".tr),
          AppSpacing.height8,
          AccountTextField(hintText: 'jondoe@gmail.com'),
          AppSpacing.height16,
          _heading("Phone Number".tr),
          SizedBox(height: 3),
          AccountTextField(hintText: '+ 778 9874 123'),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.only(bottom: 30.h),
        child: Padding(
          padding: AppSpacing.screenPadding,
          child: AppButton(text1: "Save".tr),
        ),
      ),
    );
  }

  _heading(String title) {
    return AppText(
      text: title,
      fontSize: 14.sp,
      color: AppColors.textDark,
      fontWeight: FontWeight.w600,
    );
  }
}
