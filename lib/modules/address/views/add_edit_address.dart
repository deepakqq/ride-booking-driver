import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/address/views/select_address_screen.dart';
import 'package:annale_driver/widgets/add_address_text_field.dart';
import 'package:annale_driver/widgets/app_appbar.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'package:annale_driver/widgets/app_normal_appbar.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddEditAddress extends StatelessWidget {
  final bool edit;
  const AddEditAddress({Key? key, this.edit = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // ✅ important
      appBar: AppNormalAppBar(
        title: edit ? "Edit Address".tr : "Add New Address".tr,
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
                AddAddressTextField(
                  title: "Select Exact Location".tr,
                  hintText: "📍 ${"Pick location".tr}",
                  onTap: () {
                    // location picker
                    Get.to(() => SelectAddressScreen());
                  },
                  showSuffixIcon: true,
                ),
                AppSpacing.height16,
                AddAddressTextField(
                  title: "Label Name",
                  hintText: "e.g. ${"Home".tr}",
                ),
                AppSpacing.height16,
                AddAddressTextField(
                  title: "Full Address".tr,
                  hintText: "Auto-filled from Google Places API".tr,
                ),
              ],
            ),
          ),

          // ✅ Save button at bottom (80px from bottom)
          Positioned(
            bottom: 80.h,
            left: 24.w,
            right: 24.w,
            child: AppButton(
              text1: "Save".tr,
              callback: () {
                if (edit) {
                  Get.back();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
