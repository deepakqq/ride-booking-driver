import 'package:annale_driver/modules/auth/controllers/auth_controller.dart';
import 'package:annale_driver/core/routes/app_routes.dart';
import 'package:annale_driver/modules/auth/widgets/auth_header.dart';
import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'package:annale_driver/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AddressDetailsScreen extends StatefulWidget {
  const AddressDetailsScreen({super.key});

  @override
  State<AddressDetailsScreen> createState() => _AddressDetailsScreenState();
}

class _AddressDetailsScreenState extends State<AddressDetailsScreen> {
  AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(height: 8.h),
                    AuthHeader(
                      showSubtitle: true,
                      showBackBtn: true,
                      subTitle:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      title: authController.userType == UserType.driver
                          ? "Enter Address Details".tr
                          : "Add Business Address",
                    ),

                    AppSpacing.height4,

                    AppSpacing.height15,

                    AppSpacing.height15,
                    AppTextfield(
                      prefixImagePath: AppImages.iconHouse,
                      hintText: authController.userType == UserType.driver
                          ? "house no"
                          : "shop no",
                    ),
                    AppSpacing.height15,
                    AppTextfield(
                      prefixImagePath: AppImages.iconStreet,
                      hintText: "street & area",
                    ),
                    AppSpacing.height15,
                    AppTextfield(
                      prefixImagePath: AppImages.iconCity,
                      hintText: "city",
                    ),
                    AppSpacing.height15,
                    AppTextfield(
                      prefixImagePath: AppImages.iconPinL,
                      hintText: "zipcode",
                    ),
                    AppSpacing.height15,
                    AppTextfield(
                      prefixImagePath: AppImages.iconState,
                      hintText: "state",
                    ),
                    AppSpacing.height16,

                    SizedBox(height: 16.h),

                    SizedBox(height: 16.h),
                  ],
                ),
              ),

              SizedBox(height: 28.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(22.r),
        child: AppButton(
          text1: "Next".tr,
          callback: () {
            Get.toNamed(AppRoutes.bankAccountDetails);
          },
        ),
      ),
    );
  }
}
