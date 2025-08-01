import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/rating_review/widgets/rating_review_card.dart';
import 'package:annale_driver/modules/rides/views/review_screen.dart';
import 'package:annale_driver/modules/rides/widgets/ride_history_btn.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'package:annale_driver/widgets/app_normal_appbar.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:annale_driver/widgets/ride/ride_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RatingReviewScreen extends StatefulWidget {
  const RatingReviewScreen({super.key});

  @override
  State<RatingReviewScreen> createState() => _RatingReviewScreenState();
}

class _RatingReviewScreenState extends State<RatingReviewScreen> {
  bool showCompletedRide = true;
  bool showCanceledRide = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNormalAppBar(title: "Ratings Overview"),
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
                    AppText(
                      text: "Todays's",
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                    AppSpacing.height8,
                    RatingReviewCard(
                      title: 'Rebecca Davis',
                      dateTime: 'Sat, Dec 5, 02:49 PM',
                      pickup: 'SBI Bank, Baner',
                      drop: 'Central Park',
                      price: '281.00',
                      vehicleImage: AppImages.bike1,
                      driverImage: 'assets/images/driver1.png',
                      status: "canceled",
                      statusButton: SizedBox(),
                    ),
                    AppSpacing.height12,
                    AppText(
                      text: "Dec 2025",
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                    AppSpacing.height8,
                    RatingReviewCard(
                      title: 'Skylar Herwits',
                      dateTime: 'Sat, Dec 5, 02:49 PM',
                      pickup: 'SBI Bank, Baner',
                      drop: 'Central Park',
                      price: '281.00',
                      vehicleImage: AppImages.bike1,
                      driverImage: 'assets/images/driver1.png',
                      status: "canceled",
                      statusButton: SizedBox(),
                    ),

                    RatingReviewCard(
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

                    RatingReviewCard(
                      title: 'Makenna Vaccaro',
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
