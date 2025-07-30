import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/theme/app_gradient.dart';
import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/modules/home/controllers/ride_controller.dart';
import 'package:annale_driver/modules/home/widgets/bottom_sheet/cancel_ride_sheet.dart';
import 'package:annale_driver/modules/home/widgets/show_direction.dart';
import 'package:annale_driver/modules/home/widgets/show_rating_star.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:annale_driver/widgets/app_text.dart';
import 'package:annale_driver/core/values/app_fonts.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';

class PickupScreen extends StatelessWidget {
  const PickupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // RideController
    return Scaffold(
      backgroundColor: Colors.white, // इमेज जैसा सफेद बैकग्राउंड
      body: Stack(
        children: [
          // --- Map Placeholder ---
          Positioned.fill(
            child: Container(
              color: Colors.grey[300], // मैप बैकग्राउंड कलर
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
            top: 50.h, // स्टेटस बार के नीचे से थोड़ा स्पेस
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
                            Colors.green,
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
                                text:
                                    "Picking up Rebecca", // इमेज में दिख रहा है
                                fontSize: AppFonts.size12,
                                color: AppColors.textGrey,
                              ),
                            ],
                          ),
                          _buildCircularIconButton(
                            AppImages.iconChat1,
                            Colors.green,
                          ), // चैट आइकन
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
                              color: Colors.grey.shade200, // Placeholder color
                              image: const DecorationImage(
                                image: AssetImage(
                                  "assets/images/profile-girl.png",
                                ), // अपनी एसेट इमेज पाथ दें
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: const Icon(
                              Icons.person,
                              color: Colors.grey,
                            ), // Placeholder icon
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

                      // Ride Details Header
                      AppText(
                        text: "Ride Details",
                        fontSize: AppFonts.size16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      AppSpacing.height16,

                      // Pickup/Drop-off Details
                      _buildRideDetailRow(
                        icon: Icons.circle, // पिकअप के लिए भरा हुआ सर्कल
                        iconColor: Colors.black,
                        address: "8134 Franz Parkways, Suite 80...",
                        isPickup: true, // यह पिकअप है
                      ),
                      AppSpacing.height12,
                      _buildRideDetailRow(
                        icon: Icons
                            .circle_outlined, // ड्रॉप-ऑफ के लिए आउटलाइन सर्कल
                        iconColor: Colors.grey,
                        address: "Ale's Park",
                        isPickup: false, // यह ड्रॉप-ऑफ है
                      ),
                      AppSpacing.height30,

                      // Action Buttons (Accept Ride / Reject Ride)
                      Container(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
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
      ),
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
        color: color,
        gradient: AppGradients.green,
      ),
      child: Image.asset(icon, height: 24.h, width: 24.w),
    );
  }

  Widget _buildRideDetailRow({
    required IconData icon,
    required Color iconColor,
    required String address,
    required bool isPickup, // यह बताता है कि यह पिकअप है या ड्रॉप-ऑफ
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // लेफ्ट साइड में आइकन (रेडियो बटन जैसा)
        Container(
          width: 20.r,
          height: 20.r,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isPickup
                ? AppColors.black
                : Colors
                      .transparent, // पिकअप के लिए काला, ड्रॉपऑफ के लिए पारदर्शी
            border: Border.all(
              color: isPickup
                  ? Colors.transparent
                  : Colors
                        .grey
                        .shade400, // पिकअप के लिए बॉर्डर नहीं, ड्रॉपऑफ के लिए ग्रे बॉर्डर
              width: 6.r,
            ),
          ),
          child: Center(
            child: Container(
              width: 10.r,
              height: 10.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white, // इमेज में ड्रॉपऑफ के लिए अंदरूनी ग्रे डॉट
              ),
            ),
          ),
        ),
        AppSpacing.width16,
        // एड्रेस टेक्स्ट
        Expanded(
          child: AppText(
            text: address,
            fontSize: AppFonts.size14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
