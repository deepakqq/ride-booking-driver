import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/widgets/add_address_text_field.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'package:annale_driver/widgets/app_normal_appbar.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:annale_driver/widgets/dialogs/success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddAccountScreen extends StatelessWidget {
  final bool edit;
  const AddAccountScreen({Key? key, this.edit = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBG,
      resizeToAvoidBottomInset: true, // ✅ important
      appBar: AppNormalAppBar(
        title: "Add New Bank Account".tr,
        screenBGColor: true,
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 24.w,
              right: 24.w,
              bottom: 120.h, // ✅ space for the Save button
            ),
            child: ListView(
              children: [
                AppSpacing.height16,
                AppText(
                  text: "Add Bank Account".tr,
                  fontWeight: FontWeight.w600,
                  fontSize: 15.sp,
                ),
                AppSpacing.height16,

                AddAddressTextField(
                  borderLight: true,
                  backgroundTrans: true,
                  radius: 8,
                  title: "Bank Name".tr,
                  hintText: "Enter here".tr,
                  onTap: () {
                    // location picker
                  },
                ),
                AppSpacing.height16,
                AddAddressTextField(
                  borderLight: true,
                  backgroundTrans: true,
                  radius: 8,
                  title: "Branch".tr,
                  hintText: "Enter here".tr,
                  onTap: () {
                    // location picker
                  },
                ),
                AppSpacing.height16,
                AddAddressTextField(
                  borderLight: true,
                  backgroundTrans: true,
                  radius: 8,
                  title: "Account Holder Name".tr,
                  hintText: "Enter here".tr,
                  onTap: () {
                    // location picker
                  },
                ),
                AppSpacing.height16,
                AddAddressTextField(
                  borderLight: true,
                  backgroundTrans: true,
                  radius: 8,
                  title: "Account Number".tr,
                  hintText: "---- ---- ----".tr,
                  onTap: () {
                    // location picker
                  },
                ),
                AppSpacing.height16,

                AddAddressTextField(
                  borderLight: true,
                  backgroundTrans: true,
                  radius: 8,
                  title: "Routing Number".tr,
                  hintText: "---- ---- ---- ".tr,
                  onTap: () {
                    // location picker
                  },
                ),
                AppSpacing.height16,
              ],
            ),
          ),

          // ✅ Save button at bottom (80px from bottom)
          Positioned(
            bottom: 80.h,
            left: 24.w,
            right: 24.w,
            child: AppButton(
              text1: "Add".tr,
              callback: () {
                // if (edit) {
                //   Get.back();
                // }

                showSuccessDialog(
                  context: context,
                  buttonText: "Close",
                  title: 'Congratulations!',
                  subtitle: 'Your new account has been added.',
                  onButtonPressed: () {
                    Get.back(); // or Navigator.pop(context);
                    Get.back(); // or Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
