import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/modules/notification_setting/controllers/notification_controller.dart';
import 'package:annale_driver/widgets/app_normal_appbar.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationSettingsScreen extends StatelessWidget {
  final controller = Get.put(NotificationSettingsController());

  NotificationSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBG,
      appBar: AppNormalAppBar(
        title: "Notification Settings".tr,
        screenBGColor: true,
      ),
      // ✅ Your own Custom AppBar should be used here
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(color: Color(0xFF2D6F3F), width: 1),
          ),
          padding: EdgeInsets.all(16.w),
          child: Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // PUSH
                _sectionTitle('Push Notifications'.tr),
                _settingRow(
                  title: 'Enable Push Notifications'.tr,
                  subtitle:
                      'Get real-time updates about your rides, promotions, and more.',
                  value: controller.pushNotification.value,
                  onChanged: (val) => controller.pushNotification.value = val,
                ),

                SizedBox(height: 16.h),

                // EMAIL
                _sectionTitle('Email Notifications'),
                _settingRow(
                  title: 'Enable Email Notifications',
                  subtitle:
                      'Receive email updates about your account, promotions, and news.',
                  value: controller.emailNotification.value,
                  onChanged: (val) => controller.emailNotification.value = val,
                ),

                SizedBox(height: 16.h),

                // SMS
                _sectionTitle('SMS Notifications'),
                _settingRow(
                  title: 'Enable SMS Notifications',
                  subtitle:
                      'Get SMS updates about your rides and important account information.',
                  value: controller.smsNotification.value,
                  onChanged: (val) => controller.smsNotification.value = val,
                ),

                SizedBox(height: 24.h),

                _sectionTitle('Notification Categories'),

                _switchOnlyRow(
                  label: 'Ride Updates',
                  value: controller.rideUpdates.value,
                  onChanged: (val) => controller.rideUpdates.value = val,
                ),
                _switchOnlyRow(
                  label: 'Promotions',
                  value: controller.promotions.value,
                  onChanged: (val) => controller.promotions.value = val,
                ),
                _switchOnlyRow(
                  label: 'News',
                  value: controller.news.value,
                  onChanged: (val) => controller.news.value = val,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return AppText(
      text: title.tr,
      fontWeight: FontWeight.w600,
      fontSize: 18.sp,
      color: Colors.black,
    );
  }

  Widget _settingRow({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.tr,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  subtitle.tr,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
        ),
        // Switch(
        //   value: value,
        //   onChanged: onChanged,
        //   activeTrackColor: Color(0xff7BDA40),
        // ),
        CustomSwitch(value: value, onChanged: onChanged),
      ],
    );
  }

  Widget _switchOnlyRow({
    required String label,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label.tr,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
          CustomSwitch(value: value, onChanged: onChanged),
          // Switch(
          //   value: value,
          //   onChanged: onChanged,
          //   activeTrackColor: Color(0xff7BDA40),
          // ),
        ],
      ),
    );
  }
}

class CustomSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        width: 52.w,
        height: 32.h,
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: value ? Color(0xFF7BDA40) : Colors.grey.shade300,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 3,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: AnimatedAlign(
          duration: Duration(milliseconds: 250),
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            height: 24.h,
            width: 24.h,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 6,
                  offset: Offset(2, 2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
