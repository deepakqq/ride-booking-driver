import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/export.dart';

class AppImageUploadBox extends StatelessWidget {
  final VoidCallback? onTap;

  const AppImageUploadBox({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: const Color(0xFF63D391),
      strokeWidth: 1.5,
      dashPattern: [8, 6],
      borderType: BorderType.RRect,
      // borderRadius: BorderRadius.circular(12.r), // ✅ FIXED
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText(
              text: "Upload Picture".tr,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            SizedBox(height: 4.h),
            AppText(
              text: "Tap to upload your profile photo".tr,
              fontSize: 10.sp,
              color: Colors.black54,
            ),
            SizedBox(height: 8.h),
            InkWell(
              onTap: onTap ?? () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Color(0xFFC4FAD1),
                  borderRadius: AppRadius.small,
                ),
                child: AppText(
                  text: "Upload".tr,
                  fontSize: 10.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
