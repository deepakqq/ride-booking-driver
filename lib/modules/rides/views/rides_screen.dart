import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/rides/views/review_screen.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:annale_driver/widgets/ride/ride_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RidesScreen extends StatelessWidget {
  const RidesScreen({super.key});

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
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      height: 55.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        border: Border.all(color: AppColors.textDark),
                        borderRadius: AppRadius.r20,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.black87),
                          AppSpacing.width8,
                          AppText(
                            text: 'Search Date, Car name'.tr,
                            color: Colors.black87,
                          ),
                        ],
                      ),
                    ),
                    AppSpacing.height8,
                    AppSpacing.height8,

                    AppText(
                      text: "Todays's",
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    AppSpacing.height8,
                    RideCard(
                      title: 'Hero Honda Pulser',
                      dateTime: 'Sat, Dec 14, 02:49 PM',
                      pickup: 'SBI Bank, Baner',
                      drop: 'Central Park',
                      price: '254.00',
                      vehicleImage: AppImages.bike1,
                      driverImage: 'assets/images/driver1.png',
                      statusButton: AppButton(
                        height: 45.h,
                        text1: "Track",
                        // width: 100,
                        callback: () {},
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
                      title: 'Royal Enfield',
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
                      title: 'Hero Honda Pulser',
                      dateTime: 'Sat, Dec 5, 02:49 PM',
                      pickup: 'SBI Bank, Baner',
                      drop: 'Central Park',
                      price: '281.00',
                      vehicleImage: AppImages.bike1,
                      driverImage: 'assets/images/driver1.png',
                      statusButton: SizedBox(),
                      status: 'reviewed',
                    ),

                    RideCard(
                      title: 'Royal Enfield',
                      dateTime: 'Sat, Dec 5, 02:49 PM',
                      pickup: 'SBI Bank, Baner',
                      drop: 'Central Park',
                      price: '281.00',
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
