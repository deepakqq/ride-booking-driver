import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletCardTile1 extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback? callback;
  final bool showBigImage;
  const WalletCardTile1({
    Key? key,
    this.showBigImage = false,
    this.title = "Change",

    this.callback,
    this.imagePath = AppImages.walletMasterCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSpacing.paddingAllMD,
      decoration: BoxDecoration(
        borderRadius: AppRadius.r10,
        color: Color(0xffE5E6E5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(imagePath, height: showBigImage ? 40.h : 30.h),
              AppSpacing.width8,
              AppText(text: title, fontSize: 16, fontWeight: FontWeight.bold),
            ],
          ),
          Icon(Icons.arrow_right_sharp, color: Colors.black, size: 35.r),
        ],
      ),
    );
  }
}
