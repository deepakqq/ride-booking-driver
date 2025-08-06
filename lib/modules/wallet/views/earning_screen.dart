import 'package:annale_driver/core/theme/app_gradient.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/wallet/controllers/wallet_controller.dart';
import 'package:annale_driver/modules/wallet/views/custom_menu.dart';
import 'package:annale_driver/modules/wallet/widgets/payment_history_tile.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EarningScreen extends GetView<WalletController> {
  final bool showDownloadReport;
  const EarningScreen({super.key, this.showDownloadReport = false});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.white,
          leading: IconButton(
            padding: const EdgeInsets.all(0),
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "${controller.earningScreenTitle.value} Earning ",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Text(
                "(65.00 ",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Text(
                "HTG",
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
              Text(
                ")",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          actions: [
            CustomPopupMenu(
              menuItems: controller.menuItems,
              onItemSelected: (v) {
                print(v);
                controller.earningScreenTitle.value = v;
                if (v == "Daily") {
                  print(v);
                  print(v);
                  print(v);
                  print(v);
                  controller.itemsLength.value = 4;
                  print(controller.itemsLength);
                }
                if (v == "Weekly") {
                  controller.itemsLength.value = 14;
                }
                if (v == "Monthly") {
                  controller.itemsLength.value = 14;
                }
              },
              icon: Image.asset(
                "assets/images/icons/icon-menu.png",
                height: 22.h,
              ),
            ),
            AppSpacing.width16,
          ],
        ),
        body: Padding(
          padding: AppSpacing.screenPadding,
          child: Column(
            children: [
              Expanded(
                // यहाँ ListView को Expanded में लपेटा गया है
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: AppRadius.r8,
                    gradient: AppGradients.green,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: AppRadius.r8,
                        color: const Color(0xffffffff),
                      ),
                      child: ListView.builder(
                        itemCount: controller.itemsLength.value,
                        itemBuilder: (context, index) {
                          print('rebuild');
                          print(controller.itemsLength);
                          var data = controller.paymentHistoryData[index];
                          return PaymentHistoryTile(
                            bigText: '${data['bigText']}',
                            smallText: data['smallText'].toString(),
                            iconPath: data['iconPath'].toString(),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              AppSpacing.height20,
            ],
          ),
        ),
        bottomNavigationBar: showDownloadReport
            ? Padding(
                padding: AppSpacing.screenPadding,
                child: AppButton(
                  text1: "Download Report",
                  fontSize: 14,
                  height: 45,
                ),
              )
            : null,
      );
    });
  }
}
