// widgets/custom_popup_menu.dart

import 'package:annale_driver/core/theme/app_gradient.dart';

import 'package:annale_driver/modules/wallet/views/earning_screen.dart'; // EarningScreen को इम्पोर्ट करें
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomPopupMenu extends StatelessWidget {
  final List<String> menuItems;
  final Function(String)
  onItemSelected; // एक फ़ंक्शन जो आइटम चयन को हैंडल करेगा
  final Widget? icon; // कस्टम आइकन के लिए

  const CustomPopupMenu({
    super.key,
    required this.menuItems,
    required this.onItemSelected,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: onItemSelected,
      color: Colors.transparent,
      elevation: 0,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem<String>(
            enabled: false,
            padding: EdgeInsets.zero,
            child: _buildGradientMenu(context),
          ),
        ];
      },
      child:
          icon ??
          Image.asset(
            "assets/images/icons/icon-menu.png", // डिफ़ॉल्ट आइकन
            height: 22.h,
          ),
    );
  }

  Widget _buildGradientMenu(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
      width: 140.w,
      decoration: BoxDecoration(
        gradient: AppGradients.greenLight, // आपका ग्रेडिएंट
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(menuItems.length * 2 - 1, (index) {
          if (index.isEven) {
            final i = index ~/ 2;
            return GestureDetector(
              onTap: () {
                Navigator.pop(context); // पॉपअप बंद करें
                onItemSelected(menuItems[i]); // कॉलबैक ट्रिगर करें
                Get.to(() => const EarningScreen()); // नेविगेट करें
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 16),
                child: Text(
                  menuItems[i],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          } else {
            return Divider(color: Colors.white.withOpacity(0.3), height: 1);
          }
        }),
      ),
    );
  }
}
