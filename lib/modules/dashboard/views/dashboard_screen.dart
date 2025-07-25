import 'package:annale_driver/modules/account/views/account_screen.dart';
import 'package:annale_driver/widgets/app_appbar.dart';
import 'package:annale_driver/widgets/app_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:annale_driver/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:annale_driver/modules/rides/views/rides_screen.dart';

class DashboardScreen extends StatelessWidget {
  final controller = Get.put(DashboardController());

  final List<Widget> pages = [
    Container(child: Center(child: Text("home"))),

    // RidesScreen(),
    Container(child: Center(child: Text("ride"))),
    Container(child: Center(child: Text("wallet"))),
    AccountScreen(),
    // Container(child: Center(child: Text("account"))),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppAppbar(),
        body: pages[controller.currentIndex.value],
        bottomNavigationBar: AppBottomNavigationBar(),
      ),
    );
  }
}
