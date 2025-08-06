import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/modules/auth/widgets/upload_profile.dart';
import 'package:annale_driver/widgets/app_normal_appbar.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:annale_driver/core/theme/app_gradient.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'package:get/utils.dart';

class AddDriverScreen extends StatelessWidget {
  const AddDriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppNormalAppBar(title: "Add A Driver"),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 100.h),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSpacing.height14,
                  AppText(
                    text: "Personal Information",
                    fontSize: 16.sp,
                    color: AppColors.textDark,
                    fontWeight: FontWeight.w700,
                  ),
                  AppSpacing.height16,
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
                  AppSpacing.height16,
                  const FormInputField(title: "Name", hintText: "enter here"),
                  AppSpacing.height16,
                  const FormInputField(
                    title: "Mobile Number",
                    hintText: "enter here",
                  ),
                  AppSpacing.height16,
                  const FormInputField(
                    title: "Email ID",
                    hintText: "enter here",
                  ),
                  AppSpacing.height16,
                  const FormInputField(
                    title: "Experience (Year)",
                    hintText: "enter here",
                  ),
                  AppSpacing.height16,
                  const FormInputField(
                    title: "Description",
                    hintText: "enter here",
                    maxLines: 4,
                  ),
                  AppSpacing.height16,
                  const FormInputField(
                    title: "Driver's Licence Number",
                    hintText: "enter here",
                  ),
                  AppSpacing.height14,
                  AppText(
                    text: "Upload Driver's License/ID",
                    fontSize: 16.sp,
                    color: AppColors.textDark,
                    fontWeight: FontWeight.w700,
                  ),
                  AppSpacing.height16,
                  DottedUploadContainer(
                    title: "Upload Document",
                    subtitle:
                        "Tap to upload your driver's license or ID, Ensure it's clear and readable.",
                    onUpload: () {
                      print("Upload driver's license tapped");
                    },
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
          text1: "Add",
          fontSize: 16,
          callback: () {
            print("Edit button pressed!");
          },
          gradient: AppGradients.green,
          radius: AppRadius.r12.bottomLeft.x,
        ),
      ),
    );
  }
}

class FormInputField extends StatelessWidget {
  final String title;
  final String hintText;
  final int maxLines;

  const FormInputField({
    super.key,
    required this.title,
    required this.hintText,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: title,
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),

        AppSpacing.height8,
        Container(
          height: maxLines != 1 ? null : 50.h,
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: AppRadius.r12,
            border: Border.all(color: Colors.grey.shade400, width: 1.r),
          ),
          child: TextFormField(
            textAlignVertical: TextAlignVertical.center,
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey.shade600,
              ),
              border: InputBorder.none,
            ),
            style: const TextStyle(fontSize: 16.0, color: Colors.black),
          ),
        ),
      ],
    );
  }
}

class DottedUploadContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onUpload;

  const DottedUploadContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onUpload,
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: AppRadius.r12.bottomLeft,
      padding: EdgeInsets.all(AppSpacing.md),
      dashPattern: const [8, 4],
      color: Colors.green.shade400,
      strokeWidth: 2.r,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 24.h),
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            AppSpacing.height4,
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12.0, color: Colors.grey.shade600),
            ),
            AppSpacing.height8,
            ElevatedButton(
              onPressed: onUpload,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: AppRadius.r8,
                  side: BorderSide(color: Colors.grey.shade400, width: 1.r),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg,
                  vertical: AppSpacing.sm,
                ),
                elevation: 0,
              ),
              child: const Text(
                "Upload",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
