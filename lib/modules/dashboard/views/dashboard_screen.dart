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

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final controller = Get.put(DashboardController());

  final walletController = Get.put(WalletController());

  AuthController authController = Get.find();

  List<Widget> pages = [];
  setPages() {
    pages = authController.userType == UserType.driver
        ? [HomeScreen(), RidesScreen(), WalletsScreen(), AccountScreen()]
        : [
            BusinessHomeScreen(),
            DriversScreen(),
            WalletsScreen(),
            AccountScreen(),
          ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setPages();
  }

  @override
  Widget build(BuildContext context) {
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
