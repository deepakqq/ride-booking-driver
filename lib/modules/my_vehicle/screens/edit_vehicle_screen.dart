import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/theme/app_gradient.dart';
import 'package:annale_driver/modules/my_vehicle/widgets/vehicle_image_picker_card.dart';
import 'package:annale_driver/widgets/add_address_text_field.dart';
import 'package:annale_driver/widgets/app_normal_appbar.dart';
import 'package:annale_driver/widgets/dialogs/animatated_success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

import 'package:annale_driver/widgets/app_text.dart';
import 'package:annale_driver/core/values/app_fonts.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/widgets/app_button.dart';

class EditVehicleScreen extends StatefulWidget {
  final String vehicleImagePath;
  final bool isEdit;

  const EditVehicleScreen({
    super.key,
    this.isEdit = true,
    this.vehicleImagePath = 'assets/images/bike-details.png',
  });

  @override
  State<EditVehicleScreen> createState() => _EditVehicleScreenState();
}

class _EditVehicleScreenState extends State<EditVehicleScreen> {
  TextEditingController textDescription = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textDescription.text =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppNormalAppBar(
        title: widget.isEdit ? "Edit Vehicle Details".tr : "Add A Vehicle",
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 8.h, right: 22.w, left: 22.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSpacing.height16,
                AppText(
                  text: "About Vehicle".tr,
                  fontWeight: FontWeight.w800,
                  fontSize: 15.sp,
                ),
                AppSpacing.height16,

                AddAddressTextField(
                  borderLight: true,
                  backgroundTrans: true,
                  radius: 8,
                  title: "Vehicle Manufacturer".tr,
                  hintText: "Ola".tr,
                  onTap: () {
                    // location picker
                  },
                ),
                AppSpacing.height16,

                AddAddressTextField(
                  borderLight: true,
                  backgroundTrans: true,
                  radius: 8,
                  title: "License Plate Number".tr,
                  hintText: "BGY-3891".tr,
                  onTap: () {
                    // location picker
                  },
                ),

                AppSpacing.height16,

                AddAddressTextField(
                  borderLight: true,
                  maxline: 6,
                  backgroundTrans: true,
                  radius: 8,
                  title: "Add Description".tr,
                  hintText: "BGY-3891".tr,
                  controller: textDescription,
                  onTap: () {
                    // location picker
                  },
                ),
                AppSpacing.height16,
                Text(
                  "Attach photos of the vehicle".tr,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                AppSpacing.height16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                AppSpacing.height16,
                AppText(
                  text: "Specs".tr,
                  fontWeight: FontWeight.w800,
                  fontSize: 15.sp,
                ),
                AppSpacing.height16,

                AddAddressTextField(
                  borderLight: true,
                  backgroundTrans: true,
                  radius: 8,
                  title: "Fuel Type".tr,
                  hintText: "Electric".tr,
                  onTap: () {
                    // location picker
                  },
                ),
                AppSpacing.height16,

                AddAddressTextField(
                  borderLight: true,
                  backgroundTrans: true,
                  radius: 8,
                  title: "Number of passenger".tr,
                  hintText: "1".tr,
                  onTap: () {},
                ),
                AppSpacing.height16,

                AddAddressTextField(
                  borderLight: true,
                  backgroundTrans: true,
                  radius: 8,
                  title: "Power".tr,
                  hintText: "2.8 W".tr,
                  onTap: () {},
                ),

                AppSpacing.height16,

                AddAddressTextField(
                  borderLight: true,
                  backgroundTrans: true,
                  radius: 8,
                  title: "Max Speed".tr,
                  hintText: "80km/h".tr,
                  onTap: () {},
                ),
                AppSpacing.height16,

                AddAddressTextField(
                  borderLight: true,
                  backgroundTrans: true,
                  radius: 8,
                  title: "Acceleration".tr,
                  hintText: "0-60 mph: 04 : 09 sec".tr,
                  onTap: () {},
                ),
                AppSpacing.height16,
                AppText(
                  text: "Pricing".tr,
                  fontWeight: FontWeight.w800,
                  fontSize: 15.sp,
                ),
                AppSpacing.height16,

                AddAddressTextField(
                  borderLight: true,
                  backgroundTrans: true,
                  radius: 8,
                  title: "Hourly Pricing".tr,
                  hintText: "HTG 10:00".tr,
                  onTap: () {
                    // location picker
                  },
                ),
                AppSpacing.height16,

                AddAddressTextField(
                  borderLight: true,
                  backgroundTrans: true,
                  radius: 8,
                  title: "Daily Pricing".tr,
                  hintText: "HTG 200:00".tr,
                  onTap: () {
                    // location picker
                  },
                ),
                AppSpacing.height16,
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: AppSpacing.screenPadding,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: AppRadius.r20.copyWith(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .15),
              offset: Offset(0, -4),
              blurRadius: 5,
            ),
          ],
        ),
        child: AppButton(
          fontSize: 14.sp,
          height: 45.h,
          text1: "Save",
          callback: () {
            showAnimatadSuccessDialog(
              context,
              message: "You Has Been Successfully Edited This Vehicle.".tr,

              onDismiss: () {
                Navigator.of(context).pop();
              },
            );
          },
          gradient: AppGradients.green,
          radius: AppRadius.r12.bottomLeft.x,
        ),
      ),
    );
  }
}
