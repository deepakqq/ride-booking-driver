import 'package:annale_driver/core/routes/app_routes.dart';
import 'package:annale_driver/modules/auth/controllers/auth_controller.dart';
import 'package:annale_driver/core/routes/app_routes.dart';
import 'package:annale_driver/modules/auth/widgets/auth_dropdown.dart';
import 'package:annale_driver/modules/auth/widgets/auth_header.dart';
import 'package:annale_driver/modules/auth/widgets/upload_profile.dart';
import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/my_vehicle/widgets/vehicle_image_picker_card.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:annale_driver/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class BusinessDetailsScreen extends StatefulWidget {
  const BusinessDetailsScreen({super.key});

  @override
  State<BusinessDetailsScreen> createState() => _BusinessDetailsScreenState();
}

class _BusinessDetailsScreenState extends State<BusinessDetailsScreen> {
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
                      subTitle:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      showSubtitle: true,
                      title: "Enter Business Details".tr,
                    ),

                    AppSpacing.height16,
                    Row(
                      children: [
                        AppText(
                          text: "Upload Company Logo".tr,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    AppSpacing.height4,

                    AppImageUploadBox(),
                    AppSpacing.height15,

                    AppTextfield(
                      prefixImagePath: AppImages.iconHouse,
                      hintText: "company name",
                    ),
                    AppSpacing.height15,
                    AppTextfield(
                      prefixImagePath: AppImages.iconCallAuth,
                      hintText: "company contact no",
                    ),
                    AppSpacing.height15,
                    AppTextfield(
                      prefixImagePath: AppImages.iconEmailAuth,
                      hintText: "company email id",
                    ),

                    AppSpacing.height15,
                    AppTextfield(
                      maxLine: 4,
                      prefixImagePath: AppImages.iconEmailAuth,
                      hintText: "company description",
                    ),
                    authController.userType == UserType.driver
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Attach photos of the vehicle".tr,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              AppSpacing.height16,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  VehicleImagePickerCard(
                                    cardSize: 86,
                                    imagePath: "assets/images/bike-details.png",
                                    // onTap: () => _pickImage(1),
                                  ),
                                  VehicleImagePickerCard(
                                    cardSize: 86,
                                    imagePath: "",
                                    // onTap: () => _pickImage(2),
                                  ),
                                  VehicleImagePickerCard(
                                    cardSize: 86,
                                    imagePath: "",
                                    // onTap: () => _pickImage(3),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : SizedBox(),

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
            Get.toNamed(AppRoutes.addressDetails);
          },
        ),
      ),
    );
  }
}
