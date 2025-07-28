import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/widgets/app_normal_appbar.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';

class TncScreen extends StatelessWidget {
  const TncScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBG,
      appBar: AppNormalAppBar(
        title: "Terms & Conditions".tr,
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
    'title': "Service Agreement".tr,
    'des':
        "By using our ride-sharing app, you agree to these terms. We provide a platform connecting riders with drivers. We are not a transportation provider.",
  },
  {
    'title': "User Responsibilities".tr,
    'des':
        "You must be 18+ to use our app. Provide accurate info, respect drivers, and follow local laws. Misuse may lead to account termination.",
  },

  {
    'title': "Payment Terms".tr,
    'des':
        "Fares are calculated based on distance and time. Payment is due upon ride completion. We use secure payment methods.",
  },
  {
    'title': "Cancellation Policy".tr,
    'des':
        "Cancellations may incur fees. Refer to our cancellation policy for details. Repeated cancellations may affect your account.",
  },
  {
    'title': "Liability".tr,
    'des':
        "We are not liable for damages arising from your use of the app. Our liability is limited to the fullest extent permitted by law.",
  },
];
