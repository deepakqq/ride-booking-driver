import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/bookings/views/booking_screen.dart';
import 'package:annale_driver/modules/business_my_vehicle/screens/business_vehicle_details_screen.dart';
import 'package:annale_driver/modules/business_my_vehicle/screens/edit_vehicle_screen.dart';
import 'package:annale_driver/modules/business_my_vehicle/widgets/business_vehicle_info_card.dart';
import 'package:annale_driver/modules/business_my_vehicle/widgets/driver_bottom_sheet.dart';
import 'package:annale_driver/modules/my_vehicle/screens/edit_vehicle_screen.dart';
import 'package:annale_driver/modules/wallet/views/earning_screen.dart';
import 'package:annale_driver/widgets/app_normal_appbar.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BusinessMyVehicleScreen extends StatelessWidget {
  const BusinessMyVehicleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNormalAppBar(
        title: "My Vehicle".tr,
        showAddVehicleBtn: true,
        onVehicleAdd: () {
          Get.to(() => EditVehicleScreen(isEdit: false));
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 22.w),
            child: AppText(text: "Total (04)", fontWeight: FontWeight.bold),
          ),
          AppSpacing.height8,
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,

                child: Column(
                  children: [
                    BusinessVehicleInfoCard(
                      onBooking: () {
                        Get.to(() => BookingScreen());
                      },
                      rating: 4.9,
                      ownerName: "Jon Deo, Owner",
                      vehicleType: "Electric",
                      passengerCapacity: 1,
                      onAppoint: () {
                        Get.bottomSheet(
                          const DriverListSheet(),
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                        );
                      },
                      onSeeDetails: () {
                        // Handle see details action
                        Get.to(() => BusinessVehicleDetailsScreen());
                        print("Details requested");
                      },
                      onViewEarning: () {
                        print('clicked me');
                        Get.to(() => EarningScreen(showDownloadReport: true));
                      },
                      driverAssign: true,
                    ),
                    BusinessVehicleInfoCard(
                      onBooking: () {
                        Get.to(() => BookingScreen());
                      },
                      rating: 4.9,
                      ownerName: "Jon Deo, Owner",
                      vehicleType: "Electric",
                      passengerCapacity: 1,
                      onSeeDetails: () {
                        // Handle see details action
                        Get.to(() => BusinessVehicleDetailsScreen());
                        print("Details requested");
                      },
                      onViewEarning: () {
                        print('clicked me');
                        Get.to(() => EarningScreen(showDownloadReport: true));
                      },
                      onAppoint: () {
                        Get.bottomSheet(
                          const DriverListSheet(),
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                        );
                      },
                    ),
                    BusinessVehicleInfoCard(
                      onBooking: () {
                        Get.to(() => BookingScreen());
                      },
                      onAppoint: () {
                        Get.bottomSheet(
                          const DriverListSheet(),
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                        );
                      },
                      rating: 4.9,
                      ownerName: "Jon Deo, Owner",
                      vehicleType: "Electric",
                      passengerCapacity: 1,
                      onSeeDetails: () {
                        // Handle see details action
                        Get.to(() => BusinessVehicleDetailsScreen());
                        print("Details requested");
                      },
                      onViewEarning: () {
                        print('clicked me');
                        Get.to(() => EarningScreen(showDownloadReport: true));
                      },
                    ),
                    BusinessVehicleInfoCard(
                      onBooking: () {
                        Get.to(() => BookingScreen());
                      },
                      rating: 4.9,
                      ownerName: "Jon Deo, Owner",
                      vehicleType: "Electric",
                      passengerCapacity: 1,
                      onSeeDetails: () {
                        // Handle see details action
                        Get.to(() => BusinessVehicleDetailsScreen());
                      },
                      onViewEarning: () {
                        Get.to(() => EarningScreen(showDownloadReport: true));
                      },
                      onAppoint: () {
                        Get.bottomSheet(
                          const DriverListSheet(),
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
