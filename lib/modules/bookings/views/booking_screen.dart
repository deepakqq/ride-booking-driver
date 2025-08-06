import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/bookings/views/booking_details_screen.dart';
import 'package:annale_driver/modules/bookings/widgets/booking_card.dart';
import 'package:annale_driver/modules/rides/views/review_screen.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'package:annale_driver/widgets/app_normal_appbar.dart';
import 'package:annale_driver/widgets/app_text.dart';
// import 'package:annale_driver/widgets/ride/ride_card.dart';
import 'package:annale_driver/widgets/search_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppNormalAppBar(title: "Bookings"),
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBox(),

              AppSpacing.height8,
              AppSpacing.height8,

              Expanded(
                child: ListView(
                  children: [
                    AppText(
                      text: "Todays's",
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    AppSpacing.height8,
                    BookingCard(
                      title: 'Rebeca Davis',
                      dateTime: 'Sat, Dec 14, 02:49 PM',
                      pickup: 'SBI Bank, Baner',
                      drop: 'Central Park',
                      price: "Reason: Passenger behavior concern",
                      vehicleImage: AppImages.bike1,
                      driverImage: 'assets/images/driver1.png',
                      statusButton: AppButton(),
                      status: "going",
                      track: true,
                      onVeiwBooking: () {
                        Get.to(() => BookingDetailsScreen());
                      },
                    ),
                    BookingCard(
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
                    BookingCard(
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

                      onVeiwBooking: () {
                        Get.to(() => BookingDetailsScreen());
                      },
                    ),
                    BookingCard(
                      title: 'Royal Enfield',
                      dateTime: 'Sat, Dec 5, 02:49 PM',
                      pickup: 'SBI Bank, Baner',
                      drop: 'Central Park',
                      price: "Reason: Passenger behavior",
                      vehicleImage: AppImages.bike1,
                      driverImage: 'assets/images/driver1.png',
                      status: "canceled",
                      statusButton: SizedBox(),

                      onVeiwBooking: () {
                        Get.to(() => BookingDetailsScreen());
                      },
                    ),

                    BookingCard(
                      title: 'Abram Vetroves',
                      dateTime: 'Sat, Dec 5, 02:49 PM',
                      pickup: 'SBI Bank, Baner',
                      drop: 'Central Park',
                      price: '281.00',
                      vehicleImage: AppImages.bike1,
                      driverImage: 'assets/images/driver1.png',
                      statusButton: SizedBox(),
                      status: 'reviewed',

                      onVeiwBooking: () {
                        Get.to(() => BookingDetailsScreen());
                      },
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
