import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/wallet/controllers/wallet_controller.dart';
import 'package:annale_driver/modules/wallet/views/withdraw_screen.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WalletBalanceBox extends StatelessWidget {
  const WalletBalanceBox({super.key});

  @override
  Widget build(BuildContext context) {
    WalletController walletController = Get.find();
    return Container(
      // padding: EdgeInsets.only(top: 125, right: 8, bottom: 16, left: 16),
      height: Get.height * .2,
      width: Get.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xff7BDA40), Color(0xff2D6F3F)],
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            offset: Offset(3, 3),
            color: Colors.black.withValues(alpha: .2),
          ),
        ],
        borderRadius: BorderRadius.circular(16),
      ),

      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            width: 233.48.w,
            height: 154,
            //top: 3,
            // right: 45,
            bottom: 30,
            right: 8,
            child: Image.asset(
              'assets/images/wallet-logo-bg.png',
              // height: 150,
              //width: 150,
              fit: BoxFit.contain,
            ),
          ),

          Align(
            alignment: Alignment.center,

            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    text: "Available Balance".tr,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xff151518),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  AppText(
                    text: "3690.00 HTG",
                    maxLines: 1,

                    color: Color(0xff151518),
                    fontWeight: FontWeight.w800,
                    fontSize: 28,

                    // overflow: TextOverflow.visible,
                  ),

                  AppSpacing.height14,
                  Container(
                    // width: Get.width * .4,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 3,
                      ),
                      onPressed: () {
                        Get.to(WithdrawScreen());
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/icons/icon-withdraw.png',
                            height: 22.h,
                          ),
                          AppSpacing.width8,
                          AppText(
                            text: "Withdraw",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
