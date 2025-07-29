import 'package:annale_driver/core/theme/app_gradient.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/wallet/controllers/wallet_controller.dart';
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
    return Padding(
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

                PopupMenuButton<String>(
                  onSelected: controller.onMenuItemSelected,
                  // Remove popup background so we can build a custom one
                  color: Colors.transparent,
                  elevation: 0,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem<String>(
                        enabled: false, // Disable default interaction
                        padding: EdgeInsets.zero,
                        child: _buildGradientMenu(context),
                      ),
                    ];
                  },
                  child: Image.asset(
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
    );
  }

  Widget _buildGradientMenu(BuildContext context) {
    final items = controller.menuItems;

    return Container(
      padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
      width: 140.w,
      decoration: BoxDecoration(
        gradient: AppGradients.greenLight,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(items.length * 2 - 1, (index) {
          if (index.isEven) {
            final i = index ~/ 2;
            return GestureDetector(
              onTap: () {
                Navigator.pop(context); // Close popup
                controller.onMenuItemSelected(items[i]);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 16),
                child: Text(
                  items[i],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          } else {
            return Divider(color: Colors.white.withOpacity(0.3), height: 1);
          }
        }),
      ),
    );
  }
}
