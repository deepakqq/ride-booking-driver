import 'package:annale_driver/core/theme/app_gradient.dart';
import 'package:annale_driver/core/values/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnlineBtn extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onToggle;

  const OnlineBtn({
    super.key,
    required this.isDarkMode,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onToggle(!isDarkMode),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
        width: 110.w,
        height: 40.h,
        decoration: BoxDecoration(
          gradient: isDarkMode ? AppGradients.green : AppGradients.red,
          // color: isDarkMode ? Colors.black : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Text (Light Mode / Dark Mode)
            AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              alignment: isDarkMode
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  isDarkMode ? 'Online'.tr : 'Offline'.tr,
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            // Circle Icon that slides
            AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              alignment: isDarkMode
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Container(
                height: 35,
                width: 35,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) =>
                      ScaleTransition(scale: animation, child: child),
                  child: Image.asset(
                    isDarkMode ? AppImages.iconOnline : AppImages.iconOffline,
                    key: ValueKey(isDarkMode),
                    // color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
