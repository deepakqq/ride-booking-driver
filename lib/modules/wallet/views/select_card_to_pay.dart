import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/values/app_images.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/auth/views/app_success_screen.dart';
import 'package:annale_driver/modules/wallet/widgets/wallet_add_card_btn.dart';
import 'package:annale_driver/modules/wallet/widgets/wallet_card_tile.dart';
import 'package:annale_driver/modules/wallet/widgets/wallet_card_tile1.dart';
import 'package:annale_driver/widgets/app_normal_appbar.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectCardToPayScreen extends StatelessWidget {
  final bool payToDriver;
  final bool payBeforRide;
  const SelectCardToPayScreen({
    Key? key,
    this.payToDriver = false,
    this.payBeforRide = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(PaymentController());
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: true, // ✅ important
      appBar: AppNormalAppBar(title: "Add Balance".tr),
      body: Padding(
        padding: AppSpacing.screenPadding,
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(text: "Cards".tr, fontWeight: FontWeight.bold),
                  AppSpacing.height8,
                  WalletCardTile(
                    callback: () {
                      if (payBeforRide && payToDriver) {
                        Get.to(
                          () => AppSuccessScreen(
                            showRemindMe: false,
                            bgColorGreen: true,
                            showMessage: false,
                            btnText: "View Ride",
                            title: "Payment Successfully Done",
                            subtitle:
                                "Don’t worry, we’ll let you know if there’s a\n problem with your Payment",
                          ),
                        );
                      } else {
                        Get.to(
                          () => AppSuccessScreen(
                            showRemindMe: payToDriver ? true : false,
                            bgColorGreen: true,
                            showMessage: false,
                            btnText: payToDriver
                                ? "Rate Your Ride"
                                : "Back To Wallet",
                            title: "Payment Successfully Done",
                            subtitle:
                                "Don’t worry, we’ll let you know if there’s a\n problem with your Payment",
                          ),
                        );
                      }
                    },
                  ),
                  AppSpacing.height16,
                  WalletAddCardBtn(),
                  AppSpacing.height30,
                  AppText(
                    text: "Digital Wallets".tr,
                    fontWeight: FontWeight.bold,
                  ),
                  AppSpacing.height8,
                  WalletCardTile1(
                    showBigImage: true,
                    title: "Apple Pay".tr,
                    imagePath: AppImages.walletApple,
                  ),
                  AppSpacing.height16,
                  WalletCardTile1(
                    showBigImage: true,
                    title: "MonCash".tr,
                    imagePath: AppImages.walletMoon,
                  ),
                  AppSpacing.height30,
                  AppText(
                    text: "Other Payment Methods".tr,
                    fontWeight: FontWeight.bold,
                  ),
                  AppSpacing.height8,
                  WalletCardTile1(
                    showBigImage: false,
                    title: "Wallet".tr,
                    imagePath: AppImages.walletWallet,
                  ),
                  AppSpacing.height16,
                  WalletCardTile1(
                    showBigImage: false,
                    title: "Cash".tr,
                    imagePath: AppImages.walletCash,
                  ),
                ],
              ),
            ),

            // ✅ Save button at bottom (80px from bottom)
          ],
        ),
      ),
    );
  }
}

List<String> ll = [
  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
];
