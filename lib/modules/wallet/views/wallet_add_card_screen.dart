import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/wallet/views/wallet_textfield.dart';
import 'package:annale_driver/widgets/add_address_text_field.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'package:annale_driver/widgets/app_normal_appbar.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WalletAddCardScreen extends StatelessWidget {
  final bool edit;
  const WalletAddCardScreen({Key? key, this.edit = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // ✅ important
      appBar: AppNormalAppBar(title: "Add New Card".tr),
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
                // AppSpacing.height16,
                // AppText(
                //   text: "Add Debit or Credit Card".tr,
                //   fontWeight: FontWeight.w500,
                //   fontSize: 13.sp,
                // ),
                AppSpacing.height16,
                WalletTextfield(
                  radius: 8,
                  title: "CARD HOLDER NAME".tr,
                  hintText: "Name".tr,
                  onTap: () {
                    // location picker
                  },
                ),
                AppSpacing.height16,

                WalletTextfield(
                  radius: 8,
                  title: "CARD NUMBER".tr,
                  hintText: "Enter your card number".tr,
                  onTap: () {
                    // location picker
                  },
                ),
                AppSpacing.height16,

                AppText(
                  text: "DEBIT CARD".tr,
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                  color: Color(0xffE7B84C),
                ),
                AppSpacing.height16,
                Row(
                  children: [
                    Expanded(
                      child: WalletTextfield(
                        borderLight: true,
                        backgroundTrans: true,
                        radius: 8,
                        title: "EXPIRY DATE".tr,
                        hintText: "MM/YY",
                        onTap: () {
                          // location picker
                        },
                      ),
                    ),
                    AppSpacing.width16,
                    Expanded(
                      child: WalletTextfield(
                        borderLight: true,
                        backgroundTrans: true,
                        radius: 8,
                        title: "CVC",
                        hintText: "CVC",
                        onTap: () {
                          // location picker
                        },
                      ),
                    ),
                  ],
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
                Get.back();
              },
            ),
          ),
        ],
      ),
    );
  }
}
