import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/theme/app_gradient.dart';
import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/modules/home/controllers/ride_controller.dart';
import 'package:annale_driver/modules/home/widgets/bottom_sheet/cancel_ride_sheet.dart';
import 'package:annale_driver/modules/home/widgets/bottom_sheet/otp_verification_sheet.dart';
import 'package:annale_driver/modules/home/widgets/ride_details_section.dart';
import 'package:annale_driver/modules/home/widgets/show_direction.dart';
import 'package:annale_driver/modules/home/widgets/show_rating_star.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    // TODO: implement initState
    super.initState();
    // ignore: implicit_call_tearoffs
    _statusDisposer = ever(rideController.rideStatus, (RideStatus status) {
      if (status == RideStatus.atPickup) {
        showOtpBottomSheet(
          context: context,
          onNext: () {
            rideController.rideStatus.value = RideStatus.enRouteToDropoff;
            print(rideController.rideStatus);
            Future.delayed(Duration(seconds: 3), () {
              rideController.rideStatus.value = RideStatus.atDropoff;
              print(rideController.rideStatus);
            });
            Get.back();
          },
        );
      }
    });
  }

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
      body: Obx(() {
        return Stack(
          children: [
            // --- Map Placeholder ---
            Positioned.fill(
              child: Container(
                color: Colors.grey[300],
                child: const Center(
                  child: Text(
                    "Google Map Placeholder",
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
              ),
            ),

            // --- Top Navigation Guidance ---
            Positioned(
              top: 50.h,
              left: AppSpacing.md,
              right: AppSpacing.md,
              child: ShowDirection(
                instruction: "Go straight on JSQ Complex Road",
                distance: "400m",
                icon: "",
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
                                text: "Navigate",
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
                              AppImages.iconPhone,
                              Colors.white,
                            ), // कॉल आइकन
                            Column(
                              children: [
                                AppText(
                                  text: "4 min away",
                                  fontSize: AppFonts.size16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                AppText(
                                  text: "Picking up Rebecca",
                                  fontSize: AppFonts.size12,
                                  color: AppColors.textGrey,
                                ),
                              ],
                            ),
                            rideController.rideStatus.value ==
                                        RideStatus.enRouteToDropoff ||
                                    rideController.rideStatus.value ==
                                        RideStatus.atDropoff
                                ? _buildCircularIconButton(
                                    AppImages.iconSos,
                                    Colors.white,
                                  )
                                : _buildCircularIconButton(
                                    AppImages.iconChat1,
                                    Colors.green,
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
                                text: "Rebecca Davis",
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

                        rideController.rideStatus.value == RideStatus.atDropoff
                            ? AppButton(
                                height: 50.h,
                                text1: "Request Payment",
                                fontSize: 16.sp,
                              )
                            : SizedBox(),

                        Container(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () {
                              print(rideController.rideStatus);
                              // rideController.rideStatus.value =
                              //     RideStatus.enRouteToDropoff;
                              showCancelRideBottomSheet(context);
                            },
                            child: AppText(
                              text: "Cancle Ride",
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
        );
      }),
    );
  }

  // --- Helper Widgets ---
  Widget _buildCircularIconButton(String icon, Color color) {
    return Container(
      padding: EdgeInsets.all(12.r),
      width: 50.r,
      height: 50.r,
      decoration: BoxDecoration(
        shape: BoxShape.circle,

        gradient: AppGradients.green,
      ),
      child: Image.asset(icon, height: 24.h, width: 24.w, color: color),
    );
  }
}
