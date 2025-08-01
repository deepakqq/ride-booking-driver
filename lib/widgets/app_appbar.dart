import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/notification_setting/views/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class AppAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    print('=====================================');
    print('appbar');
    print('=====================================');
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Colors.black, // Thin black line at bottom
              width: .7, // You can adjust thickness here
            ),
          ),
        ),
        padding: AppSpacing.horizontalLG,
        height: preferredSize.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Location Icon and Text
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFF265C3A),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Image.asset('assets/images/icons/icon-location.png'),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Location'.tr,
                      style: TextStyle(fontSize: 12.sp, color: Colors.black),
                    ),
                    Text(
                      'Times Square, NY',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // Notification Icon
            GestureDetector(
              onTap: () {
                Get.to(() => NotificationScreen());
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF265C3A),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(4),
                child: Image.asset('assets/images/icons/icon-notification.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
