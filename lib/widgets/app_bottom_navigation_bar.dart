import 'package:annale_driver/modules/auth/controllers/auth_controller.dart';
import 'package:annale_driver/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppBottomNavigationBar extends StatelessWidget {
  AppBottomNavigationBar({Key? key}) : super(key: key);
  final controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: .7.h,
          color: Colors.black, // ✅ subtle black line
        ),
        Obx(() {
          return BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: controller.currentIndex.value,
            onTap: controller.changeTab,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12.sp,
            unselectedFontSize: 12.sp,
            selectedItemColor: const Color(0xFF2E7D32),
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                icon: SizedBox(
                  height: 52.h,
                  width: 52.w,
                  child: Image.asset('assets/images/icons/icon-home.png'),
                ),
                activeIcon: SizedBox(
                  height: 52.h,
                  width: 52.w,
                  child: Image.asset('assets/images/icons/icon-home-s.png'),
                ),
                label: 'Home'.tr,
              ),
              authController.userType == UserType.driver
                  ? BottomNavigationBarItem(
                      icon: SizedBox(
                        height: 52.h,
                        width: 52.w,
                        child: Image.asset('assets/images/icons/icon-ride.png'),
                      ),
                      activeIcon: SizedBox(
                        height: 52.h,
                        width: 52.w,
                        child: Image.asset(
                          'assets/images/icons/icon-ride-s.png',
                        ),
                      ),
                      label: 'Rides'.tr,
                    )
                  : BottomNavigationBarItem(
                      icon: SizedBox(
                        height: 52.h,
                        width: 52.w,
                        child: Image.asset(
                          'assets/images/icons/icon-dash-driver.png',
                        ),
                      ),
                      activeIcon: SizedBox(
                        height: 52.h,
                        width: 52.w,
                        child: Image.asset(
                          'assets/images/icons/icon-dash-driver-s.png',
                        ),
                      ),
                      label: 'Driver'.tr,
                    ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  height: 52.h,
                  width: 52.w,
                  child: Image.asset('assets/images/icons/icon-wallet.png'),
                ),
                activeIcon: SizedBox(
                  height: 52.h,
                  width: 52.w,
                  child: Image.asset('assets/images/icons/icon-wallet-s.png'),
                ),
                label: 'Wallet'.tr,
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  height: 52.h,
                  width: 52.w,
                  child: Image.asset('assets/images/icons/icon-account.png'),
                ),
                activeIcon: SizedBox(
                  height: 52.h,
                  width: 52.w,
                  child: Image.asset('assets/images/icons/icon-account-s.png'),
                ),
                label: 'Account'.tr,
              ),
            ],
          );
        }),
      ],
    );
  }
}
