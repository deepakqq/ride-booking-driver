import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/my%20rides/widgets/vehicle_info_card.dart';
import 'package:annale_driver/widgets/app_normal_appbar.dart';
import 'package:flutter/material.dart';

class MyVehicleScreen extends StatelessWidget {
  const MyVehicleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNormalAppBar(title: "My Vehicle"),
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
              print("Details requested");
            },
          ),
        ],
      ),
    );
  }
}
