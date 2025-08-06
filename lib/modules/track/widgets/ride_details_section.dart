import 'package:annale_driver/modules/home/controllers/ride_controller.dart';
import 'package:flutter/material.dart';
import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:annale_driver/widgets/app_text.dart';
import 'package:annale_driver/core/values/app_fonts.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class RideDetailsSection extends StatelessWidget {
  const RideDetailsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RideController rideController = Get.find<RideController>();
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: "Ride Details",
            fontSize: AppFonts.size16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          AppSpacing.height16,

          rideController.rideStatus.value != RideStatus.atDropoff
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 20.r,
                      height: 20.r,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            // rideController.rideStatus.value ==
                            // RideStatus.enRouteToPickup
                            Colors.black,
                        // : Colors.transparent,
                        border: Border.all(
                          color:
                              rideController.rideStatus.value ==
                                  RideStatus.enRouteToPickup
                              ? Colors.black
                              : Colors.grey.shade400,
                          width: 6.r,
                        ),
                      ),
                      child: Center(
                        child: Container(
                          width: 10.r,
                          height: 10.r,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    AppSpacing.width8,
                    AppText(
                      text: "Pickup: ",
                      fontSize: AppFonts.size14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    Expanded(
                      child: AppText(
                        text: "8134 Franz Parkways, Suite 80...",
                        fontSize: AppFonts.size14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )
              : SizedBox(),
          rideController.rideStatus.value != RideStatus.atDropoff
              ? AppSpacing.height12
              : SizedBox(),
          rideController.rideStatus.value != RideStatus.atDropoff
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 20.r,
                      height: 20.r,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(
                          color:
                              rideController.rideStatus.value ==
                                  RideStatus.enRouteToDropoff
                              ? Colors.black
                              : Colors.grey.shade400,
                          width: 6.r,
                        ),
                      ),
                      child: Center(
                        child: Container(
                          width: 10.r,
                          height: 10.r,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    AppSpacing.width8,
                    AppText(
                      text: "Drop-off: ",
                      fontSize: AppFonts.size14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    Expanded(
                      child: AppText(
                        text: "Ale's Park",
                        fontSize: AppFonts.size14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )
              : SizedBox(),

          rideController.rideStatus.value == RideStatus.atDropoff
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 20.r,
                      height: 20.r,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(
                          color:
                              rideController.rideStatus.value ==
                                  RideStatus.atDropoff
                              ? AppColors.primary
                              : Colors.grey.shade400,
                          width: 6.r,
                        ),
                      ),
                      child: Center(
                        child: Container(
                          width: 10.r,
                          height: 10.r,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    AppSpacing.width8,
                    AppText(
                      text: "Drop-off: ",
                      fontSize: AppFonts.size14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    Expanded(
                      child: AppText(
                        text: "Ale's Park",
                        fontSize: AppFonts.size14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )
              : SizedBox(),
        ],
      );
    });
  }
}
