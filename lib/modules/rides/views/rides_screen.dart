import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/rides/views/review_screen.dart';
import 'package:annale_driver/modules/rides/widgets/ride_history_btn.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:annale_driver/widgets/ride/ride_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RidesScreen extends StatefulWidget {
  const RidesScreen({super.key});

  @override
  State<RidesScreen> createState() => _RidesScreenState();
}

class _RidesScreenState extends State<RidesScreen> {
  bool showCompletedRide = true;
  bool showCanceledRide = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: RideHistoryBtn(
                      callback: () {
                        setState(() {
                          if (showCompletedRide) return;
                          showCanceledRide = false;
                          showCompletedRide = !showCompletedRide;
                        });
                      },
                      isSelected: showCompletedRide,
                    ),
                  ),
                  AppSpacing.width16,
                  Expanded(
                    child: RideHistoryBtn(
                      callback: () {
                        setState(() {
                          if (showCanceledRide) return;
                          showCompletedRide = false;
                          showCanceledRide = !showCanceledRide;
                        });
                      },
                      isSelected: showCanceledRide,
                      title: "Canceled Ride",
                    ),
                  ),
                ],
              ),
              AppSpacing.height8,
              AppSpacing.height8,
              if (showCompletedRide)
                Expanded(
                  child: ListView(
                    children: [
                      AppText(
                        text: "Todays's",
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      AppSpacing.height8,
                      RideCard(
                        title: 'Rebeca Davis',
                        dateTime: 'Sat, Dec 14, 02:49 PM',
                        pickup: 'SBI Bank, Baner',
                        drop: 'Central Park',
                        price: "Reason: Passenger behavior concern",
                        vehicleImage: AppImages.bike1,
                        driverImage: 'assets/images/driver1.png',
                        statusButton: AppButton(
                          // height: 45.h,
                          // text1: "Accept",
                          // // width: 100,
                          // callback: () {},
                        ),
                        status: "going",
                        track: true,
                      ),
                      AppSpacing.height12,
                      AppText(
                        text: "Dec 2025",
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      AppSpacing.height8,
                      RideCard(
                        title: 'James Kenter',
                        dateTime: 'Sat, Dec 5, 02:49 PM',
                        pickup: 'SBI Bank, Baner',
                        drop: 'Central Park',
                        price: '281.00',
                        vehicleImage: AppImages.bike1,
                        driverImage: 'assets/images/driver1.png',
                        statusButton: AppButton(
                          radius: 50,
                          fontSize: 14.sp,

                          height: 36.h,
                          text1: "Add Reviews",
                          width: 160,
                          gradient: LinearGradient(
                            colors: [Color(0xffE7B84C), Color(0xffC99316)],
                          ),
                          callback: () {
                            Get.to(() => ReviewScreen());
                          },
                        ),
                      ),

                      RideCard(
                        title: 'Abram Vetroves',
                        dateTime: 'Sat, Dec 5, 02:49 PM',
                        pickup: 'SBI Bank, Baner',
                        drop: 'Central Park',
                        price: '281.00',
                        vehicleImage: AppImages.bike1,
                        driverImage: 'assets/images/driver1.png',
                        statusButton: SizedBox(),
                        status: 'reviewed',
                      ),
                    ],
                  ),
                ),
              if (showCanceledRide)
                Expanded(
                  child: ListView(
                    children: [
                      AppText(
                        text: "Todays's",
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      AppSpacing.height8,
                      RideCard(
                        title: 'Royal Enfield',
                        dateTime: 'Sat, Dec 5, 02:49 PM',
                        pickup: 'SBI Bank, Baner',
                        drop: 'Central Park',
                        price: "Reason: Passenger behavior",
                        vehicleImage: AppImages.bike1,
                        driverImage: 'assets/images/driver1.png',
                        status: "canceled",
                        statusButton: SizedBox(),
                      ),
                      AppSpacing.height12,
                      AppText(
                        text: "Dec 2025",
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      AppSpacing.height8,
                      RideCard(
                        title: 'Royal Enfield',
                        dateTime: 'Sat, Dec 5, 02:49 PM',
                        pickup: 'SBI Bank, Baner',
                        drop: 'Central Park',
                        price: "Reason: Passenger behavior",
                        vehicleImage: AppImages.bike1,
                        driverImage: 'assets/images/driver1.png',
                        status: "canceled",
                        statusButton: SizedBox(),
                      ),

                      RideCard(
                        title: 'Royal Enfield',
                        dateTime: 'Sat, Dec 5, 02:49 PM',
                        pickup: 'SBI Bank, Baner',
                        drop: 'Central Park',
                        price: "Reason: Passenger behavior",
                        vehicleImage: AppImages.bike1,
                        driverImage: 'assets/images/driver1.png',
                        status: "canceled",
                        statusButton: SizedBox(),
                      ),

                      RideCard(
                        title: 'Royal Enfield',
                        dateTime: 'Sat, Dec 5, 02:49 PM',
                        pickup: 'SBI Bank, Baner',
                        drop: 'Central Park',
                        price: "Reason: Passenger behavior",
                        vehicleImage: AppImages.bike1,
                        driverImage: 'assets/images/driver1.png',
                        status: "canceled",
                        statusButton: SizedBox(),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
