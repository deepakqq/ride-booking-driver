import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/modules/business_my_vehicle/widgets/business_show_rating.dart';
import 'package:annale_driver/widgets/app_normal_appbar.dart';
import 'package:annale_driver/widgets/dialogs/animatated_success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:annale_driver/core/theme/app_gradient.dart';
import 'package:annale_driver/core/values/app_fonts.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'package:get/get.dart';

// driverImagePath: "",
//           driverName: "",
//           driverMobile: "",
//           driverEmail: "",
//           driverDescription: "driverDescription",
//           driverRating: "4.0",kj
//           driverReviews: "230",

class DriverDetailsScreen extends StatelessWidget {
  // final String driverImagePath;
  // final String driverName;
  // final String driverMobile;
  // final String driverEmail;
  // final String driverDescription;
  // final String driverRating;
  // final String driverReviews;
  final bool forAppoint;

  const DriverDetailsScreen({
    super.key,
    this.forAppoint = false,
    // required this.driverImagePath,
    // required this.driverName,
    // required this.driverMobile,
    // required this.driverEmail,
    // required this.driverDescription,
    // required this.driverRating,
    // required this.driverReviews,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppNormalAppBar(title: "Details"),
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 66.r,
              backgroundImage: AssetImage("assets/images/user-avatar1.png"),
            ),
          ),
          AppSpacing.height30,
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 80.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: AppSpacing.horizontalMD,
                    child: AppText(
                      text: "Description",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  AppSpacing.height8,
                  Padding(
                    padding: AppSpacing.horizontalMD,
                    child: AppText(
                      text:
                          "Lorem ipsum dolor sit amet consectetur. Elementum mattis eu nisi semper. Vel ut est elementum diam vestibulum aliquet placerat dignissim. Bibendum maecenas nisi id suspendisse magna laoreet. Eget arcu mauris tincidunt a id sit.",
                      fontSize: 13.sp,
                      color: Colors.grey.shade700,
                      height: 1.2,
                    ),
                  ),
                  AppSpacing.height12,
                  Padding(
                    padding: AppSpacing.horizontalMD,
                    child: Row(
                      children: [
                        BusinessShowRating(rating: "4.9"),
                        AppSpacing.width8,
                        AppText(
                          text: "${230} Reviews",
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ],
                    ),
                  ),
                  AppSpacing.height30,
                  Padding(
                    padding: AppSpacing.horizontalMD,
                    child: AppText(
                      text: "Personal Info",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  AppSpacing.height8,
                  Padding(
                    padding: AppSpacing.horizontalMD,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BusinessTextField(
                          title: "Name",
                          hintText: "Haylie Korsgaard",
                          readOnly: true,
                        ),
                        AppSpacing.height16,
                        BusinessTextField(
                          title: "Mobile",
                          hintText: "+1 778 1254 369",
                          readOnly: true,
                        ),
                        AppSpacing.height16,
                        BusinessTextField(
                          title: "Email",
                          hintText: "email@example.com",
                          readOnly: true,
                        ),
                        AppSpacing.height16,
                        BusinessTextField(
                          title: "Experience (Years)",
                          hintText: "5",
                          readOnly: true,
                        ),
                        AppSpacing.height16,
                        BusinessTextField(
                          title: "Driver’s Licence Number",
                          hintText: "1245782032593232",
                          readOnly: true,
                        ),
                        AppSpacing.height16,
                        AppText(
                          text: "Driver’s Licence ID",
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),

                        Container(
                          height: Get.height * .25,
                          decoration: BoxDecoration(
                            borderRadius: AppRadius.r16,
                            image: DecorationImage(
                              image: AssetImage('assets/images/dri-li.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: AppSpacing.screenPadding,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(2, 2),
              spreadRadius: 5,
              blurRadius: 6,
              color: const Color.fromARGB(255, 214, 214, 214),
            ),
          ],
        ),

        child: AppButton(
          fontSize: 16,
          text1: forAppoint ? "Appoint Him" : "Edit",
          callback: () {
            if (forAppoint) {
              showAnimatadSuccessDialog(
                context,
                message: "You successfully add this driver with this bike.",
                onDismiss: () {
                  Get.back();
                },
              );
            }
            print("Edit button pressed!");
          },

          radius: AppRadius.r12.bottomLeft.x,
        ),
      ),
    );
  }
}

// BusinessTextField helper widget is required for this screen
class BusinessTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final bool readOnly;
  final TextEditingController? controller;

  const BusinessTextField({
    Key? key,
    required this.title,
    required this.hintText,
    this.readOnly = false,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: title,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        AppSpacing.height8,
        Container(
          padding: EdgeInsets.only(left: 16.w),
          alignment: Alignment.centerLeft,
          width: double.infinity,
          height: 45.h,
          decoration: BoxDecoration(
            borderRadius: AppRadius.r12,
            color: AppColors.textfieldBG,
          ),
          child: AppText(
            text: hintText,
            fontSize: 12.sp,
            color: AppColors.textDark,
          ),
        ),
      ],
    );
  }
}
