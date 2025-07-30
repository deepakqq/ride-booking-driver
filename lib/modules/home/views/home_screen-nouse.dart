import 'package:annale_driver/modules/home/widgets/home_container.dart';
import 'package:annale_driver/modules/home/widgets/online_btn.dart';
import 'package:annale_driver/modules/home/widgets/percentage_circle.dart'; // मान लिया कि आपकी क्लास का नाम यही है
import 'package:annale_driver/modules/home/widgets/weekly_challenge_card.dart'; // यदि यह एक अलग फाइल है
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:math' as math; // math.pi के लिए

// यहाँ CustomShapedContainer में उपयोग की गई notchHeight को डिफाइन करें
// यह वही मान होना चाहिए जो आपने अपनी home_container.dart फाइल में _TopNotchClipper में सेट किया है।
double _notchHeight = 10.h; // HomeContainer के नॉच की ऊंचाई

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Map Background Placeholder
          Container(
            color: Colors.grey[300],
            height: double.infinity,
            width: double.infinity,
            child: const Center(child: Text("Google Map Placeholder")),
          ),

          // HomeContentBody को नीचे अलाइन करें
          Align(alignment: Alignment.bottomCenter, child: HomeContentBody()),
        ],
      ),
    );
  }
}

class HomeContentBody extends StatelessWidget {
  const HomeContentBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double homeContainerHeight = Get.height * .4;

    final double onlineButtonHeight = 48.0;

    return SizedBox(
      height: homeContainerHeight + onlineButtonHeight / 2 + _notchHeight,
      width: Get.width,

      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: HomeContainer(
              height: homeContainerHeight,
              // color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(height: onlineButtonHeight / 2 + _notchHeight + 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Weekly Challenges',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          height: 180,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              _buildChallengeCard(
                                context,
                                title: 'Earn on Monday',
                                description:
                                    'Complete 20 trips and get 35 HTG extra',
                                progressText: '2 trips done out of 20',
                                percentage: 20.0,
                                progressColor: const Color(0xFF4CAF50),
                                backgroundColor: Colors.grey.shade300,
                              ),
                              const SizedBox(width: 15),
                              _buildChallengeCard(
                                context,
                                title: 'Earn on Tuesday',
                                description:
                                    'Drive 5 hours and earn 10 HTG bonus',
                                progressText: '3 hours done out of 5',
                                percentage: 60.0,
                                progressColor: Colors.orange,
                                backgroundColor: Colors.grey.shade300,
                              ),
                              const SizedBox(width: 15),
                              _buildChallengeCard(
                                context,
                                title: 'Weekend Bonus',
                                description:
                                    'Accept 15 rides and get 20 HTG bonus',
                                progressText: '5 rides done out of 15',
                                percentage: 33.0,
                                progressColor: Colors.blue,
                                backgroundColor: Colors.grey.shade300,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            3,
                            (index) => _buildDot(index == 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildSummaryColumn('Earnings', '12.0 HTG'),
                        _buildSummaryColumn('Online', '1hr 12 mins'),
                        _buildSummaryColumn('Rides', '02'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // OnlineBtn को HomeContainer के नॉच से 12px ऊपर पोजीशन करें
          // Positioned(
          // HomeContainer के टॉप से: homeContainerHeight
          // नॉच की गहराई घटाएं: - _notchHeight
          // और 12px ऊपर उठाएं: - 12
          // फिर OnlineBtn की आधी ऊंचाई घटाएं ताकि यह सेंटर में दिखे: - onlineButtonHeight / 2
          // bottom: homeContainerHeight - _notchHeight - 4.h,
          // child: OnlineBtn(),
          // ),
        ],
      ),
    );
  }

  // --- Helper Widgets (आपके original code से, कोई बदलाव नहीं) ---

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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      progressText,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              // आपका कस्टम परसेंटेज इंडिकेटर विजेट
              PercentageCircle(
                // यहाँ आपके क्लास का नाम 'PercentageCircle' उपयोग किया गया है
                percentage: percentage,
                radius: 35.0,
                strokeWidth: 6.0,
                progressColor: progressColor,
                backgroundColor: backgroundColor,
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                startAngleOffset: math.pi * 0.75, // इमेज के अनुसार
                totalArcSweepAngle: math.pi * 1.5, // इमेज के अनुसार
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget _buildSummaryColumn(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
