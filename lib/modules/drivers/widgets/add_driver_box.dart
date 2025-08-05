import 'package:annale_driver/modules/address/views/add_edit_address.dart';
import 'package:annale_driver/modules/address/views/add_edit_address.dart';
import 'package:annale_driver/modules/drivers/views/add_driver_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddDriverBox extends StatelessWidget {
  final VoidCallback? callback;
  const AddDriverBox({super.key, this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => AddDriverScreen());
      },
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          color: const Color(0xFF7ADA3F),
          borderRadius: BorderRadius.circular(10.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ➕ Circle Icon
            Container(
              height: 32.h,
              width: 32.w,
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white),
                // border:
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 20),
            ),
            SizedBox(width: 12.w),

            // 📝 Text with Highlighted "Address"
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Add New Driver".tr,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(
                        '',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
