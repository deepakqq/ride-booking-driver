import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/widgets/app_normal_appbar.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  final todayNotifications = const [
    'Lorem ipsum is placeholder text commonly',
    'Lorem ipsum is placeholder text commonly',
  ];

  final yesterdayNotifications = const [
    'Lorem ipsum is placeholder text commonly',
    'Lorem ipsum is placeholder text commonly',
    'Lorem ipsum is placeholder text commonly',
    'Lorem ipsum is placeholder text commonly',
  ];

  final pastNotifications = const [
    'Lorem ipsum is placeholder text commonly',
    'Lorem ipsum is placeholder text commonly',
    'Lorem ipsum is placeholder text commonly',
  ];

  Widget _buildNotificationItem(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xffE2F7D9), // Light green
        borderRadius: AppRadius.r10,
      ),
      child: AppText(
        text: text,
        fontSize: 13.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    );
  }

  Widget _buildSection(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 18.h),
        Text(
          title,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 10.h),
        ...items.map(_buildNotificationItem).toList(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNormalAppBar(
        title: "Notifications".tr,
        showNotificationDeleteIcon: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: ListView(
          children: [
            _buildSection("Today's", todayNotifications),
            _buildSection("Yesterday’s", yesterdayNotifications),
            _buildSection("12 January 2023", pastNotifications),
          ],
        ),
      ),
    );
  }
}
