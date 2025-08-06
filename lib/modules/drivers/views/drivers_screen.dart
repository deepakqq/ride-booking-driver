import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/address/widgets/add_address_box.dart';
import 'package:annale_driver/modules/drivers/views/driver_detail_screen.dart';
import 'package:annale_driver/modules/drivers/widgets/add_driver_box.dart';
import 'package:annale_driver/modules/drivers/widgets/driver_card.dart';
import 'package:annale_driver/modules/track/views/track_screen.dart';
import 'package:annale_driver/modules/wallet/views/earning_screen.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:annale_driver/widgets/search_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class DriversScreen extends StatelessWidget {
  const DriversScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: AppSpacing.screenPadding,
        children: [
          SearchBox(),
          AppSpacing.height16,
          DriverCard(
            onTrack: () {
              Get.to(() => TrackScreen());
            },
            onViewEarning: () {
              Get.to(() => EarningScreen(showDownloadReport: true));
            },
            onTap: () {
              Get.to(() => DriverDetailsScreen());
            },
            profileImage: 'assets/images/user-avatar1.png',
            driverName: "Wilson Korsgaard",
            phoneNumber: "+1 778 1254 369",
            email: "email@example.com",
          ),
          DriverCard(
            onTrack: () {
              Get.to(() => TrackScreen());
            },
            onViewEarning: () {
              Get.to(() => EarningScreen(showDownloadReport: true));
            },
            profileImage: 'assets/images/user-avatar1.png',
            driverName: "Haylie Korsgaard",
            phoneNumber: "+1 778 1254 369",
            email: "email@example.com",
            onTap: () {
              Get.to(() => DriverDetailsScreen());
            },
          ),
          DriverCard(
            onTrack: () {
              Get.to(() => TrackScreen());
            },
            onViewEarning: () {
              Get.to(() => EarningScreen(showDownloadReport: true));
            },
            onTap: () {
              Get.to(() => DriverDetailsScreen());
            },
            profileImage: 'assets/images/user-avatar1.png',
            driverName: "Wilson Korsgaard",
            phoneNumber: "+1 778 1254 369",
            email: "email@example.com",
          ),
          AddDriverBox(),
          AppSpacing.height16,
          AppText(
            text:
                "✨ ${"Easily book your rides faster with saved locations like home, work, or frequent destinations.".tr}",
            fontSize: 14,
            align: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
