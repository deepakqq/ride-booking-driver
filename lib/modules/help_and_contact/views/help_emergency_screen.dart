import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/help_and_contact/controllers/help_emergency_controller.dart';
import 'package:annale_driver/modules/help_and_contact/widgets/contact_card.dart';
import 'package:annale_driver/widgets/add_address_text_field.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'package:annale_driver/widgets/app_dropdown.dart';
import 'package:annale_driver/widgets/app_normal_appbar.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HelpEmergencyScreen extends StatelessWidget {
  HelpEmergencyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HelpEmergencyController());

    return Scaffold(
      backgroundColor: AppColors.screenBG,
      appBar: AppNormalAppBar(
        title: "Help & Emergency Contact".tr,
        screenBGColor: true,
      ),
      body: Obx(() {
        if (controller.showContactCard.value) {
          // ✅ Show Contact Card
          return Padding(
            padding: AppSpacing.screenPadding,
            child: ContactCard(
              name: "Emergency Contact".tr, // Optional, can add another field
              phone: controller.contact.value,
              email: controller.email.value,
              relationship: controller.relationship.value,
              avatarAsset: 'assets/images/avatar.png', // Your avatar image
              onEdit: () {
                controller.resetForm();
              },
              onDelete: () {
                controller.resetForm();
              },
            ),
          );
        }

        // ✅ Show Form
        return ListView(
          padding: AppSpacing.screenPadding,
          children: [
            AppText(
              text: "Add Emergency Contact Person".tr,
              fontSize: 14.sp,
              color: AppColors.textDark,
              fontWeight: FontWeight.bold,
            ),
            AppSpacing.height16,
            AppDropdown<String>(
              radius: 8,
              borderLight: true,
              backgroundTrans: true,
              title: "Relationship".tr,
              hintText: "Select from here...".tr,
              items: [
                'Friend',
                'Spouse',
                'Child',
                'Brother/Sister',
                'Other relatives',
              ],
              value: controller.relationship.value.isNotEmpty
                  ? controller.relationship.value
                  : null,
              onChanged: (val) => controller.relationship.value = val ?? '',
              getLabel: (val) => val.tr,
            ),
            AppSpacing.height16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AddAddressTextField(
                    borderLight: true,
                    backgroundTrans: true,
                    radius: 8,
                    title: "First Name".tr,
                    hintText: "enter here".tr,
                    onTap: () {
                      // location picker
                    },
                  ),
                ),
                AppSpacing.width16,
                Expanded(
                  child: AddAddressTextField(
                    borderLight: true,
                    backgroundTrans: true,
                    radius: 8,
                    title: "Last Name".tr,
                    hintText: "enter here".tr,
                    onTap: () {
                      // location picker
                    },
                  ),
                ),
              ],
            ),
            AppSpacing.height16,
            AddAddressTextField(
              borderLight: true,
              backgroundTrans: true,
              radius: 8,
              title: "Contact".tr,
              hintText: "Enter here".tr,
              onTap: () {},
              controller: TextEditingController(text: controller.contact.value),
              // Save on field change
              onChanged: (val) => controller.contact.value = val,
            ),
            AppSpacing.height16,
            AddAddressTextField(
              borderLight: true,
              backgroundTrans: true,
              radius: 8,
              title: "Email".tr,
              hintText: "Enter here".tr,
              onTap: () {},
              controller: TextEditingController(text: controller.email.value),
              onChanged: (val) => controller.email.value = val,
            ),
            AppSpacing.height16,
          ],
        );
      }),
      bottomNavigationBar: Obx(() {
        if (controller.showContactCard.value) return SizedBox.shrink();

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 24.h),
          child: AppButton(
            text1: "Save".tr,
            callback: () {
              controller.submitForm();
            },
          ),
        );
      }),
    );
  }
}
