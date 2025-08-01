import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/bank_account/controllers/payment_controller.dart';
import 'package:annale_driver/modules/bank_account/views/add_account_screen.dart';
import 'package:annale_driver/modules/bank_account/widgets/bank_account_tile.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'package:annale_driver/widgets/app_normal_appbar.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PaymentController());
    return Scaffold(
      backgroundColor: AppColors.screenBG,
      resizeToAvoidBottomInset: true, // ✅ important
      appBar: AppNormalAppBar(title: "Bank Account".tr, screenBGColor: true),
      body: Padding(
        padding: AppSpacing.horizontalMD,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpacing.height16,
            AppText(
              text: "Save Accounts",
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            AppSpacing.height16,
            Expanded(
              child: Column(
                children: [
                  Obx(() {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.banks.length,
                      itemBuilder: (context, index) {
                        final card = controller.banks[index];
                        return BankAccountTile(
                          card: card,
                          isSelected:
                              controller.selectedCardId.value == card.id,
                          onTap: () => controller.selectCard(card.id),
                        );
                      },
                    );
                  }),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => AddAccountScreen());
                    },
                    child: Container(
                      height: 50.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add, color: Colors.black, size: 28.h),
                          AppSpacing.width8,
                          AppText(
                            text: "Add New Account".tr,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ✅ Save button at bottom (80px from bottom)
            AppButton(
              text1: "Save".tr,
              callback: () {
                // if (edit) {
                //   Get.back();
                // }
              },
            ),
            AppSpacing.height70,
          ],
        ),
      ),
    );
  }
}
