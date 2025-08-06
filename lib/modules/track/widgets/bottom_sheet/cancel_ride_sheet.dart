import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/modules/home/widgets/dialog/cancel_ride_dialog.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart'; // .tr के लिए

// आपकी कस्टम यूटिलिटी फाइल्स
import 'package:annale_driver/widgets/app_text.dart'; // AppText के लिए
import 'package:annale_driver/core/values/app_fonts.dart'; // AppFonts के लिए
import 'package:annale_driver/core/values/app_redius.dart'; // AppRadius के लिए
import 'package:annale_driver/core/values/app_spacing.dart'; // AppSpacing के लिए
// import 'package:annale_driver/core/theme/app_colors.dart'; // यदि रंगों की आवश्यकता हो

class CancelRideBottomSheet extends StatefulWidget {
  const CancelRideBottomSheet({super.key});

  @override
  State<CancelRideBottomSheet> createState() => _CancelRideBottomSheetState();
}

class _CancelRideBottomSheetState extends State<CancelRideBottomSheet> {
  // selectedReason को null से इनिशियलाइज़ किया गया है
  String? _selectedReason;

  // कैंसिलेशन के कारण
  final List<String> _cancellationReasons = [
    "Passenger no-show".tr,
    "Incorrect or unsafe pickup location",
    "Vehicle issue",
    "Passenger behavior concern",
    "Ride request mismatch",
    "Last-minute destination change",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // इमेज के अनुसार सफेद बैकग्राउंड
        borderRadius: AppRadius.r20.copyWith(
          bottomLeft: Radius.zero,
          bottomRight: Radius.zero,
        ), // केवल ऊपर से गोल किनारे
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // कंटेंट के साइज़ तक श्रिंक करें
        crossAxisAlignment:
            CrossAxisAlignment.start, // टेक्स्ट को बाईं ओर अलाइन करें
        children: [
          AppSpacing.height16, // हैंडल के नीचे स्पेस
          // क्लोज आइकन और हेडर टेक्स्ट
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(); // बॉटम शीट बंद करें
                  },
                  child: Icon(
                    Icons.close,
                    size: AppFonts.size24,
                    color: Colors.black,
                  ),
                ),
                AppSpacing.width8,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text:
                            "Share the reason to canceling the ride.", // इमेज के अनुसार टेक्स्ट
                        fontSize: AppFonts.size16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        align: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          AppSpacing.height16, // हेडर और "Choose an issue" के बीच स्पेस
          // "Choose an issue" टेक्स्ट
          Container(
            alignment: Alignment.center,
            child: AppText(
              align: TextAlign.center,
              text: "Choose an issue",
              fontSize: AppFonts.size14,
              fontWeight: FontWeight.w500,
              color: AppColors.textGrey,
            ),
          ),

          Divider(color: AppColors.divider, height: 40.h),
          Column(
            children: _cancellationReasons.map((reason) {
              return Padding(
                padding: EdgeInsets.only(
                  left: 16.w,
                  right: 16.w,
                  bottom: AppSpacing.height8.height!,
                ), // बटन्स के बीच वर्टिकल स्पेस
                child: _buildReasonButton(reason),
              );
            }).toList(),
          ),
          AppSpacing.height30, // बटन्स और "Submit Feedback" के बीच स्पेस
          // "Submit Feedback" बटन
          Padding(
            padding: EdgeInsets.all(16.w),
            child: AppButton(
              text1: "Submit Feedback",
              callback: _selectedReason == null
                  ? null // यदि कोई कारण नहीं चुना गया है तो बटन अक्षम (disabled) करें
                  : () {
                      print(
                        "Submit Feedback pressed for reason: $_selectedReason",
                      );
                      showCancelConfirmationDialog(context);
                    },
            ),
          ),
          AppSpacing.height16, // बॉटम पैडिंग
        ],
      ),
    );
  }

  // कारण बटन बनाने के लिए सहायक विजेट
  Widget _buildReasonButton(String reason) {
    bool isSelected = _selectedReason == reason;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedReason = reason;
        });
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 12.h,
          horizontal: AppSpacing.md,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFE8F5E9)
              : Colors.white, // चयनित होने पर हल्का हरा, अन्यथा सफेद
          borderRadius: AppRadius.r8, // इमेज में गोल किनारे
          border: Border.all(
            color: isSelected
                ? const Color(0xFF4CAF50)
                : AppColors.primary, // चयनित होने पर हरा बॉर्डर, अन्यथा ग्रे
            width: 1.5.r,
          ),
        ),
        child: AppText(
          text: reason,
          fontSize: AppFonts.size14,
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          color: Colors.black, // टेक्स्ट कलर
          align: TextAlign.center, // टेक्स्ट को सेंटर में अलाइन करें
        ),
      ),
    );
  }
}

void showCancelRideBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled:
        true, // कंटेंट के साइज़ के अनुसार ऊंचाई एडजस्ट करने के लिए
    backgroundColor: Colors.transparent, // बॉटम शीट का बैकग्राउंड पारदर्शी हो
    builder: (BuildContext context) {
      return const CancelRideBottomSheet();
    },
  );
}
