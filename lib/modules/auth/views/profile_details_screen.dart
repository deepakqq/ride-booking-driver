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

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({super.key});

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
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
                      showSubtitle: authController.userType == UserType.driver
                          ? false
                          : true,
                      title: authController.userType == UserType.driver
                          ? "Enter Profile Details".tr
                          : "Enter Creator Details",
                      subTitle:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    ),
                    authController.userType == UserType.businessOwner
                        ? SizedBox(height: 16.h)
                        : SizedBox(),
                    Row(
                      children: [
                        AppText(
                          text: "Upload Profile Picture".tr,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    AppSpacing.height4,

                    AppImageUploadBox(),
                    AppSpacing.height15,

                    Obx(
                      () => AuthDropdown(
                        hintText: 'select your gender',
                        prefixIcon: AppImages.iconGender,
                        items: const ['Male', 'Female', 'Other'],
                        value: authController.selectedGender.value,
                        onChanged: (newValue) {
                          authController.onGenderChanged(newValue);
                        },
                      ),
                    ),
                    AppSpacing.height15,
                    AppTextfield(
                      prefixImagePath: AppImages.iconBirth,
                      hintText: "enter date of birth",
                    ),
                    AppSpacing.height15,
                    AppTextfield(
                      prefixImagePath: AppImages.iconBike10,
                      hintText: "vehicle manufacturer",
                    ),
                    AppSpacing.height15,
                    AppTextfield(
                      prefixImagePath: AppImages.iconPlate,
                      hintText: "license plate number",
                    ),
                    AppSpacing.height16,
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
            if (authController.signUp == true) {
              if (authController.userType == UserType.driver) {
                Get.toNamed(AppRoutes.addressDetails);
              }
              if (authController.userType == UserType.businessOwner) {
                Get.toNamed(AppRoutes.businessDetails);
              }
            } else {}
          },
        ),
      ),
    );
  }
}
