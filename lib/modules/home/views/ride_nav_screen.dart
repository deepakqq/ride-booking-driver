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

class RideNavScreen extends StatefulWidget {
  const RideNavScreen({super.key});

  @override
  State<RideNavScreen> createState() => _RideNavScreenState();
}

class _RideNavScreenState extends State<RideNavScreen> {
  final RideController rideController = Get.find<RideController>();

  late final VoidCallback _statusDisposer;
  @override
  void initState() {
    super.initState();
    rideController.startJourney();

    _statusDisposer = ever(rideController.rideStatus, (RideStatus status) {
      if (status == RideStatus.atPickup) {
        showOtpBottomSheet(
          context: context,
          onNext: () {
            rideController.startJourney();
            print(" D D D D DD");
            rideController.rideStatus.value = RideStatus.enRouteToDropoff;
            Future.delayed(const Duration(seconds: 6), () {
              rideController.rideStatus.value = RideStatus.atDropoff;
            });
            Get.back();
          },
        );
      }
    });
  }

  startNav() {}

  @override
  void dispose() {
    _statusDisposer();
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
              top: 50.h,
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
                        // Top Row: Call, "4 min away", Chat
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildCircularIconButton(
                              icon: AppImages.iconPhone,
                              color: Colors.white,
                              callback: () {},
                            ), // कॉल आइकन
                            Column(
                              children: [
                                AppText(
                                  text: "4 min away".tr,
                                  fontSize: AppFonts.size16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                AppText(
                                  text: "Picking up Rebecca".tr,
                                  fontSize: AppFonts.size12,
                                  color: AppColors.textGrey,
                                ),
                              ],
                            ),
                            Obx(
                              () =>
                                  controller.rideStatus.value ==
                                          RideStatus.enRouteToDropoff ||
                                      controller.rideStatus.value ==
                                          RideStatus.atDropoff
                                  ? _buildCircularIconButton(
                                      callback: () {
                                        showAnimatadSuccessDialog(
                                          context,
                                          message:
                                              "An SOS message and your ride details have been sent to the Ann Ale team.",
                                        );
                                      },
                                      icon: AppImages.iconSos,
                                      color: Colors.white,
                                    )
                                  : _buildCircularIconButton(
                                      icon: AppImages.iconChat1,
                                      color: Colors.green,
                                      callback: () {
                                        Get.to(
                                          () => ChatScreen(title: "User Name"),
                                        );
                                      },
                                    ),
                            ),
                          ],
                        ),
                        AppSpacing.height12,
                        // Rider Profile Section
                        Divider(color: AppColors.divider),
                        Row(
                          children: [
                            // Profile Image Placeholder
                            Container(
                              width: 50.r,
                              height: 50.r,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    Colors.grey.shade200, // Placeholder color
                                image: const DecorationImage(
                                  image: AssetImage(
                                    "assets/images/profile-girl.png",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              // Placeholder icon
                            ),
                            AppSpacing.width16,

                            Expanded(
                              child: AppText(
                                text: "Rebecca Davis".tr,
                                fontSize: AppFonts.size16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            // Rating
                            ShowRatingStar(rating: '4.4'),
                          ],
                        ),
                        Divider(color: AppColors.divider),
                        AppSpacing.height8,

                        RideDetailsSection(),
                        AppSpacing.height30,

                        Obx(
                          () =>
                              controller.rideStatus.value ==
                                  RideStatus.atDropoff
                              ? AppButton(
                                  height: 50.h,
                                  text1: "Request Payment".tr,
                                  fontSize: 16.sp,
                                  callback: () {
                                    showPaymentOptionsSheet();
                                  },
                                )
                              : SizedBox(),
                        ),

                        Container(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () {
                              print(controller.rideStatus);
                              // controller.rideStatus.value =
                              //     RideStatus.enRouteToDropoff;
                              showCancelRideBottomSheet(context);
                            },
                            child: AppText(
                              text: "Cancle Ride".tr,
                              color: Colors.red,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        AppSpacing.height16,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Helper Widgets ---
  Widget _buildCircularIconButton({
    required String icon,
    required Color color,
    required VoidCallback callback,
  }) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        padding: EdgeInsets.all(12.r),
        width: 50.r,
        height: 50.r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,

          gradient: AppGradients.green,
        ),
        child: Image.asset(icon, height: 24.h, width: 24.w, color: color),
      ),
    );
  }
}
