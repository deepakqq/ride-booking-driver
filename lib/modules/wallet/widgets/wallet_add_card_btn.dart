import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/wallet/views/wallet_add_card_screen.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WalletAddCardBtn extends StatelessWidget {
  const WalletAddCardBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => WalletAddCardScreen());
      },
      child: Container(
        padding: AppSpacing.paddingAllMD,
        decoration: BoxDecoration(
          borderRadius: AppRadius.r10,
          color: Color(0xffE5E6E5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              text: "Add credit or debit cards".tr,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            Icon(
              Icons.add_circle_outline_outlined,
              color: Colors.black,
              size: 25.r,
            ),
          ],
        ),
      ),
    );
  }
}
