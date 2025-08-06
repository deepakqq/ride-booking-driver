import 'package:annale_driver/modules/account/views/account_screen.dart';
import 'package:annale_driver/modules/auth/controllers/auth_controller.dart';
import 'package:annale_driver/modules/business_home/views/business_home_screen.dart';
import 'package:annale_driver/modules/drivers/views/drivers_screen.dart';
import 'package:annale_driver/modules/rides/views/rides_screen.dart';
import 'package:annale_driver/modules/wallet/controllers/wallet_controller.dart';
import 'package:annale_driver/modules/wallet/views/wallets_screen.dart';
import 'package:annale_driver/modules/home/views/home_screen.dart';
import 'package:annale_driver/widgets/app_appbar.dart';
import 'package:annale_driver/widgets/app_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:annale_driver/modules/dashboard/controllers/dashboard_controller.dart';

class DashboardScreen extends GetView<DashboardController> {
  final AuthController authController = Get.find();

  List<Widget> getPages(UserType userType) {
    return userType == UserType.driver
        ? [HomeScreen(), RidesScreen(), WalletsScreen(), AccountScreen()]
        : [
            BusinessHomeScreen(),
            DriversScreen(),
            WalletsScreen(),
            AccountScreen(),
          ];
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = getPages(authController.userType);
    return Obx(
      () => Scaffold(
        extendBody: true,
        appBar: controller.showAppBar.value ? AppAppbar() : null,
        body: pages[controller.currentIndex.value],
        bottomNavigationBar: AppBottomNavigationBar(),
      ),
    );
  }
}
