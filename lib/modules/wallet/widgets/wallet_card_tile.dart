import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletCardTile extends StatelessWidget {
  final bool showCardNumber;
  final VoidCallback? callback;
  const WalletCardTile({Key? key, this.showCardNumber = false, this.callback})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        padding: AppSpacing.paddingAllMD,
        decoration: BoxDecoration(
          borderRadius: AppRadius.r10,
          color: Color(0xffE5E6E5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: "Master Card",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                AppSpacing.height8,
                Row(
                  children: [
                    Image.asset(AppImages.walletMasterCard, height: 20.h),
                    AppSpacing.width8,
                    AppText(text: "************* 436"),
                  ],
                ),
              ],
            ),
            Icon(Icons.arrow_right_sharp, color: Colors.black, size: 35.r),
          ],
        ),
      ),
    );
  }
}
