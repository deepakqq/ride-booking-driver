import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/business_home/widgets/business_details_card.dart';
import 'package:annale_driver/modules/business_home/widgets/total_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BusinessHomeBottomSection extends StatefulWidget {
  const BusinessHomeBottomSection({Key? key}) : super(key: key);

  @override
  State<BusinessHomeBottomSection> createState() =>
      _BusinessHomeBottomSectionState();
}

class _BusinessHomeBottomSectionState extends State<BusinessHomeBottomSection> {
  // late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 410.h,
      padding: EdgeInsets.only(top: 30.h, left: 16.w, right: 16.w),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/business-home-notch.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            // height: 110.h,
            child: BusinessDetailsCard(
              companyLogoAsset: AppImages.aBank,
              companyName: "companyName",
              totalTrips: 1200,
              totalBikes: 2,
              joinedDate: "12-06-2025",
            ),
          ),
          const SizedBox(height: 10),

          Container(
            // height: 40,
            child: Row(
              children: [
                Expanded(
                  child: TotalCard(
                    title: "Total Earnings",
                    earningsAmount: "30,000 HTG",
                  ),
                ),
                AppSpacing.width16,
                Expanded(
                  child: TotalCard(title: "Balance", earningsAmount: "200 HTG"),
                ),
              ],
            ),
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
