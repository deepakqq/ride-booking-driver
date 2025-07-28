import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/widgets/app_normal_appbar.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class PrivacySecurityScreen extends StatelessWidget {
  const PrivacySecurityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBG,
      appBar: AppNormalAppBar(
        title: "Privacy Security".tr,
        screenBGColor: true,
      ),

      body: ListView.builder(
        padding: AppSpacing.screenPadding,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: list[index]['title']!.tr,
                  fontSize: 16.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                AppSpacing.height8,

                AppText(
                  text: list[index]['des']!.tr,
                  fontSize: 14.sp,
                  color: Colors.black,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

var list = [
  {
    'title': "Data Collection",
    'des':
        "We collect information you provide directly, such as account details, trip requests, and payment information. We also gather data automatically, including location, device information, and app usage.",
  },
  {
    'title': "Data Use",
    'des':
        "Your data is used to provide and improve our services, personalize your experience, process payments, and communicate with you. We may also use data for research, analytics, and marketing purposes.",
  },
  {
    'title': "Data Sharing",
    'des':
        "We may share your information with service providers, business partners, and legal authorities when required. We do not sell your personal data to third parties.",
  },
  {
    'title': "Data Security",
    'des':
        "We implement security measures to protect your data from unauthorized access, alteration, or disclosure. However, no method of transmission over the internet is completely secure.",
  },
  {
    'title': "User Rights",
    'des':
        "You have the right to access, correct, or delete your personal information. You can also object to or restrict certain data processing activities. Contact us for assistance.",
  },
];
