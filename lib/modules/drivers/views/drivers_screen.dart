import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/address/widgets/add_address_box.dart';
import 'package:annale_driver/modules/drivers/widgets/add_driver_box.dart';
import 'package:annale_driver/modules/drivers/widgets/driver_card.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:annale_driver/widgets/search_box.dart';
import 'package:flutter/material.dart';
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
            profileImage: AppImages.driver1,
            driverName: "Wilson Korsgaard",
            phoneNumber: "+1 778 1254 369",
            email: "email@example.com",
          ),
          DriverCard(
            profileImage: AppImages.driver1,
            driverName: "Haylie Korsgaard",
            phoneNumber: "+1 778 1254 369",
            email: "email@example.com",
          ),
          DriverCard(
            profileImage: AppImages.driver1,
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
