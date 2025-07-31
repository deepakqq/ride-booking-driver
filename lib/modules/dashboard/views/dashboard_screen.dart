import 'package:annale_driver/modules/account/views/account_screen.dart';
import 'package:annale_driver/modules/rides/views/rides_screen.dart';
import 'package:annale_driver/modules/wallet/controllers/wallet_controller.dart';
import 'package:annale_driver/modules/wallet/views/wallets_screen.dart';
import 'package:annale_driver/modules/home/views/home_screen.dart';
import 'package:annale_driver/widgets/app_appbar.dart';
import 'package:annale_driver/widgets/app_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:annale_driver/modules/dashboard/controllers/dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {
  final controller = Get.put(DashboardController());
  final walletController = Get.put(WalletController());

  final List<Widget> pages = [
    HomeScreen(),
    RidesScreen(),
    // Container(child: Center(child: Text("ride"))),
    WalletsScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBody: true,
        appBar: AppAppbar(),
        body: pages[controller.currentIndex.value],
        bottomNavigationBar: AppBottomNavigationBar(),
      ),
    );
  }
}
