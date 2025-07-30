import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/values/app_fonts.dart';
import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/home/views/pickup_screen.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class RideRequestDialog extends StatelessWidget {
  final String assetImagePath;
  final String rating;
  final String pickupTime;
  final String travelDistance;
  final VoidCallback onAccept;
  final VoidCallback onReject;

  const RideRequestDialog({
    Key? key,
    required this.assetImagePath,
    required this.rating,
    required this.pickupTime,
    required this.travelDistance,
    required this.onAccept,
    required this.onReject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor:
          Colors.transparent, // Dialog's own background is transparent
      elevation: 0,
      insetPadding: EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
      ), // Padding from screen edges
      child: Material(
        // Use Material to apply shape and elevation to the actual content
        color: Colors.white,
        borderRadius: AppRadius.r16, // Dialog's overall rounded corners
        child: Column(
          mainAxisSize: MainAxisSize.min, // Wrap content vertically
          children: [
            AppSpacing.height16, // Top padding
            // Profile Image and Rating
            Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none, // Allow rating badge to overflow
              children: [
                // Profile Image
                Container(
                  width: 90.r, // Responsive size for image
                  height: 90.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 3.r,
                    ), // White border
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), // Image shadow
                        blurRadius: 10,
                        offset: Offset(0, 5.r),
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage("assets/images/profile-girl.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Rating Badge
                Positioned(
                  bottom: -10.r, // Position the badge below the image
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm,
                      vertical: AppSpacing.xs,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          AppRadius.r20, // Rating badge rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(
                            0.15,
                          ), // Rating badge shadow
                          blurRadius: 5,
                          offset: Offset(0, 3.r),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star_rounded,
                          color: Colors.orange,
                          size: AppFonts.size18,
                        ),
                        AppSpacing.width4,
                        AppText(
                          text: rating,
                          fontSize: AppFonts.size16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            AppSpacing.height30, // Space between rating and "Pickup in" text
            // Pickup Text
            AppText(
              text: "Pickup in $pickupTime away",
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            AppSpacing.height16,
            Container(
              height: 1.r,
              color: Colors.grey.shade300, // Light grey line
              margin: EdgeInsets.symmetric(horizontal: AppSpacing.md),
            ),
            AppSpacing.height16, // Space after the divider
            // Time and Distance Row
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Time
                  Image.asset(AppImages.iconClock, height: 24.h),
                  AppSpacing.width8,
                  AppText(
                    text: "$pickupTime", // Assuming pickupTime is just "4 min"
                    fontSize: AppFonts.size16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  AppSpacing.width32, // Horizontal divider replacement
                  Container(
                    width: 1.r,
                    height: AppFonts.size28, // Height of the vertical line
                    color: Colors.grey.shade300,
                  ),
                  AppSpacing.width32,
                  // Distance
                  Image.asset(
                    AppImages.iconRoute,
                    height: 24.h,
                  ), // Using alt_route for path/distance
                  AppSpacing.width8,
                  AppText(
                    text:
                        "$travelDistance", // Assuming travelDistance is "1.4km"
                    fontSize: AppFonts.size16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ],
              ),
            ),
            AppSpacing.height30, // Space before buttons
            // Action Buttons (Accept/Reject)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: onAccept,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.r),
                        ),
                      ), // Rounded corners
                      padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
                      elevation: 0,
                    ),
                    child: AppText(
                      text: "Accept Ride",
                      fontSize: AppFonts.size14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onReject,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(
                        0xffFD6E4F,
                      ), // Red button (similar to image)
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10.r),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
                      elevation: 0,
                    ),
                    child: AppText(
                      text: "Reject Ride",
                      fontSize: AppFonts.size14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void showRideRequestDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return RideRequestDialog(
        assetImagePath: 'assets/images/profile_placeholder.jpg',
        rating: '4.4',
        pickupTime: '4 min',
        travelDistance: '1.4km',
        onAccept: () {
          print('Ride Accepted!');
          Navigator.of(context).pop();
          Get.to(() => PickupScreen());
        },
        onReject: () {
          print('Ride Rejected!');
          Navigator.of(context).pop();
        },
      );
    },
  );
}
