import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/theme/app_gradient.dart';
import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/modules/help_support/views/chat_screen.dart';
import 'package:annale_driver/modules/home/controllers/ride_controller.dart';
import 'package:annale_driver/modules/home/widgets/bottom_sheet/cancel_ride_sheet.dart';
import 'package:annale_driver/modules/home/widgets/bottom_sheet/otp_verification_sheet.dart';
import 'package:annale_driver/modules/home/widgets/bottom_sheet/payment_option_sheet.dart';
import 'package:annale_driver/modules/home/widgets/ride_details_section.dart';
import 'package:annale_driver/modules/home/widgets/show_direction.dart';
import 'package:annale_driver/modules/home/widgets/show_rating_star.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'dart:async';

import 'package:annale_driver/widgets/dialogs/animatated_success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:annale_driver/widgets/app_text.dart';
import 'package:annale_driver/core/values/app_fonts.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:get/get.dart';

import '../widgets/dialog/ride_status_dialog.dart';

class TrackScreen extends StatefulWidget {
  const TrackScreen({super.key});

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  final RideController rideController = Get.put(RideController());

  @override
  void initState() {
    super.initState();
    rideController.startJourney();
    rideController.rideStatus.value = RideStatus.enRouteToPickup;
    Future.delayed(const Duration(seconds: 6), () {
      print('done done' * 70);
      rideController.rideStatus.value = RideStatus.atDropoff;
    });

    // _statusDisposer = ever(rideController.rideStatus, (RideStatus status) {
    //   if (status == RideStatus.atPickup) {
    //     showOtpBottomSheet(
    //       context: context,
    //       onNext: () {
    //         rideController.startJourney();
    //         print(" D D D D DD");
    //         rideController.rideStatus.value = RideStatus.enRouteToDropoff;
    //         Future.delayed(const Duration(seconds: 6), () {
    //           print('done done' * 70);
    //           rideController.rideStatus.value = RideStatus.atDropoff;
    //         });
    //         Get.back();
    //       },
    //     );
    //   }
    // });
  }

  startNav() {}

  @override
  void dispose() {
    ;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // RideController
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<RideController>(
        builder: (controller) => Stack(
          children: [
            // --- Map Placeholder ---
            Positioned.fill(
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: RideController.kGooglePlex,
                onMapCreated: controller.onRideMapCreated,
                markers: controller.markers,
                polylines: controller.polylines,
              ),
            ),

            // --- Top Navigation Guidance ---
            Positioned(
              top: 90.h,
              left: AppSpacing.md,
              right: AppSpacing.md,
              child: Obx(
                () => ShowDirection(
                  instruction:
                      "${controller.currentDirectionText}\n${controller.currentRoadName}",
                  distance: "${controller.currentDirectionDistance}",
                  icon: controller.currentDirectionIcon.value,
                  colorFirst: controller.fColor!,
                  colorSecond: controller.sColor!,
                ),
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.w),
                      child: GestureDetector(
                        onTap: () {
                          print("Navigate button pressed");
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 12.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: AppRadius.r50,
                            border: Border.all(color: Colors.black, width: .7),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 8,
                                offset: Offset(0, 4.r),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.near_me_outlined,
                                color: Colors.black,
                                size: AppFonts.size20,
                              ),
                              AppSpacing.width8,
                              AppText(
                                text: "Navigate".tr,
                                fontSize: AppFonts.size16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  AppSpacing.height12,
                  Container(
                    padding: EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: AppRadius.r20.copyWith(
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.zero,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 10,
                          offset: Offset(0, -5.r),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RideDetailsSection(),

                        AppSpacing.height30,

                        AppSpacing.height16,
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              top: 0,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(left: 22.w),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.black,
                          size: 20.h,
                        ),
                      ),
                      AppSpacing.width10,
                      AppText(
                        text: "Back",
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
