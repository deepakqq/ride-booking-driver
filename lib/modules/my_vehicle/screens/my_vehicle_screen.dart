import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/my_vehicle/screens/vehicle_details_screen.dart';
import 'package:annale_driver/modules/my_vehicle/widgets/vehicle_info_card.dart';
import 'package:annale_driver/widgets/app_normal_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyVehicleScreen extends StatelessWidget {
  const MyVehicleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNormalAppBar(title: "My Vehicle".tr),
      body: ListView(
        padding: AppSpacing.screenPadding,
        children: [
          VehicleInfoCard(
            rating: 4.9,
            ownerName: "Jon Deo, Owner",
            vehicleType: "Electric",
            passengerCapacity: 1,
            onSeeDetails: () {
              // Handle see details action
              Get.to(() => VehicleDetailsScreen());
              print("Details requested");
            },
          ),
        ],
      ),
    );
  }
}
