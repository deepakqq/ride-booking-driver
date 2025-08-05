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

class BankAccountDetailsScreen extends StatefulWidget {
  const BankAccountDetailsScreen({super.key});

  @override
  State<BankAccountDetailsScreen> createState() =>
      _BankAccountDetailsScreenState();
}

class _BankAccountDetailsScreenState extends State<BankAccountDetailsScreen> {
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
                      showBackBtn: true,
                      showSubtitle: true,
                      subTitle:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",

                      title: authController.userType == UserType.driver
                          ? "Add Bank Details".tr
                          : "Company Bank Details",
                    ),

                    AppSpacing.height4,

                    AppSpacing.height15,

                    AppSpacing.height15,
                    AppTextfield(
                      prefixImagePath: AppImages.iconBank,
                      hintText: "enter bank name",
                    ),
                    AppSpacing.height15,
                    AppTextfield(
                      prefixImagePath: AppImages.iconBranch,
                      hintText: "Branch",
                    ),
                    AppSpacing.height15,
                    AppTextfield(
                      prefixImagePath: AppImages.iconPerson1,
                      hintText: "account holder name",
                    ),
                    AppSpacing.height15,
                    AppTextfield(
                      prefixImagePath: AppImages.iconAccountNumber,
                      hintText: "account number",
                    ),
                    AppSpacing.height15,
                    AppTextfield(
                      prefixImagePath: AppImages.iconRouteNumber,
                      hintText: "routing number",
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
            Get.toNamed(AppRoutes.documentUpload);
          },
        ),
      ),
    );
  }
}
