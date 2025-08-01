import 'package:annale_driver/core/theme/app_gradient.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:annale_driver/modules/wallet/controllers/wallet_controller.dart';
import 'package:annale_driver/modules/wallet/views/custom_menu.dart';
import 'package:annale_driver/modules/wallet/views/earning_screen.dart';

import 'package:annale_driver/widgets/app_text.dart';
import 'package:annale_driver/modules/wallet/widgets/payment_history_container.dart';
import 'package:annale_driver/modules/wallet/widgets/wallet_balance_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WalletsScreen extends GetView<WalletController> {
  const WalletsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppSpacing.screenPadding,
        child: ListView(
          children: [
            WalletBalanceBox(),
            AppSpacing.height16,
            Container(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: "Recent Earnings".tr,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff0F1724),
                  ),

                  CustomPopupMenu(
                    menuItems: controller.menuItems,
                    onItemSelected: controller.onMenuItemSelected,
                    icon: Image.asset(
                      "assets/images/icons/icon-menu.png",
                      height: 22.h,
                    ),
                  ),
                ],
              ),
            ),
            AppSpacing.height8,
            PaymentHistoryContainer(),
          ],
        ),
      ),
    );
  }
}
