import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/home/controllers/ride_controller.dart';
import 'package:annale_driver/modules/home/widgets/bottom_sheet/otp_verification_sheet.dart';
import 'package:annale_driver/modules/home/widgets/dialog/ride_status_dialog.dart';
import 'package:annale_driver/modules/home/widgets/online_btn.dart';
import 'package:annale_driver/modules/home/widgets/percentage_circle.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RideController rideController = Get.find<RideController>();
  late PageController _pageController;
  int _currentPage = 0;
  late final VoidCallback _statusDisposer;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.85, initialPage: 0);

    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      rideController.startNewRideRequest(); // 3 सेकंड बाद पॉपअप ट्रिगर होगा
    });
    // RideStatus में बदलावों को सुनें और उन्हें डिस्पोज करने के लिए _statusDisposer में स्टोर करें
    _statusDisposer = ever(rideController.rideStatus, (RideStatus status) {
      if (status == RideStatus.newRequest) {
        showRideRequestDialog(context);
      } else if (status == RideStatus.atPickup) {
        // _showOtpVerificationBottomSheet();
      } else if (status == RideStatus.atDropoff) {
        // _showPaymentPendingDialog();
      } else if (status == RideStatus.rideCompleted) {
        // Get.offAll(() => RideCompletedScreen());
      } else if (status == RideStatus.rideCancelled) {
        Get.snackbar(
          "Ride Status",
          "Ride has been cancelled.",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (status == RideStatus.idle) {
        if (Get.isDialogOpen!) Get.back();
        if (Get.isBottomSheetOpen!) Get.back();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _statusDisposer();
    ;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showRideRequestDialog(context);
        },
      ),
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // Container(height: 450.h, width: double.infinity),
          Positioned(
            top: 0,
            child: Container(
              alignment: Alignment.bottomCenter,
              width: Get.width,
              height: 300.h,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 400.h,
              padding: EdgeInsets.only(top: 30.h, left: 16.w),
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/home-notch.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: "Weekly Challenges",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  AppSpacing.height12,
                  SizedBox(
                    height: 110.h,
                    child: ListView.builder(
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> challengeData;
                        if (index == 0) {
                          challengeData = {
                            'title': 'Earn on Monday',
                            'description':
                                'Complete 20 trips and get 35 HTG extra',
                            'progressText': '2 trips done out of 20',
                            'percentage': 20.0,
                          };
                        } else if (index == 1) {
                          challengeData = {
                            'title': 'Earn on Tuesday',
                            'description':
                                'Complete 40 trips and get 70 HTG Extra',
                            'progressText': '2 trips done out of 40',
                            'percentage': 10.0,
                          };
                        } else {
                          challengeData = {
                            'title': 'Weekend Bonus',
                            'description':
                                'Complete 60 trips and get 105 HTG Extra',
                            'progressText': '2 trips done out of 60',
                            'percentage': 5.0,
                          };
                        }

                        return Padding(
                          padding: EdgeInsets.only(right: 15.w),
                          child: _buildChallengeCard(
                            context,
                            title: challengeData['title'],
                            description: challengeData['description'],
                            progressText: challengeData['progressText'],
                            percentage: challengeData['percentage'],
                            progressColor: const Color(0xFF4CAF50),
                            backgroundColor: Colors.grey.shade300,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => _buildDot(index == _currentPage),
                    ),
                  ),
                  AppSpacing.height8,
                  Container(
                    margin: EdgeInsets.only(right: 16.w),
                    height: 80.h,
                    width: Get.width,
                    decoration: decoration,
                    child: Row(
                      children: [
                        _buildSummaryColumn("Earnings", "12.0 HTG"),
                        Container(
                          height: 50.h,
                          color: Color(0xff7990B780),
                          width: 1,
                        ),
                        _buildSummaryColumn("Online", "1hr 12 mins"),
                        Container(
                          height: 50.h,
                          color: Color(0xff7990B780),
                          width: 1,
                        ),
                        _buildSummaryColumn("Rides", "02"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(bottom: 120.h),
              child: OnlineBtn(
                isDarkMode: isOnline,
                onToggle: (v) {
                  isOnline = v;
                  setState(() {});
                  // showRideRequestDialog(context);
                  showOtpBottomSheet(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isOnline = true;
  Widget _buildChallengeCard(
    BuildContext context, {
    required String title,
    required String description,
    required String progressText,
    required double percentage,
    required Color progressColor,
    required Color backgroundColor,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      padding: EdgeInsets.symmetric(horizontal: 12.w),

      decoration: decoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    AppSpacing.height8,
                    AppText(
                      text: description,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      height: 1.2,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 5),
                    AppText(
                      text: progressText,
                      fontSize: 13,
                      color: AppColors.primaryDark,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              PercentageCircle(
                percentage: percentage,
                radius: 50.r,
                strokeWidth: 10.w,
                progressColor: progressColor,
                backgroundColor: backgroundColor,
                textStyle: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                startAngleOffset: math.pi * 0.85,
                totalArcSweepAngle: math.pi * 1.3,
              ),
            ],
          ),
        ],
      ),
    );
  }

  var decoration = BoxDecoration(
    color: Colors.white,
    borderRadius: AppRadius.r8,
    border: Border.all(color: Colors.black.withValues(alpha: .3)),
  );

  Widget _buildDot(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8.h,
      width: 8.h,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget _buildSummaryColumn(String title, String value) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            text: title,
            fontSize: 13,
            color: AppColors.textGrey,
            fontWeight: FontWeight.w600,
          ),
          AppText(
            text: value,
            fontSize: 16,
            color: AppColors.textDark,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
