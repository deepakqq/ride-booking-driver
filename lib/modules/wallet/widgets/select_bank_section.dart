import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/theme/app_gradient.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/bank_account/controllers/payment_controller.dart';
import 'package:annale_driver/modules/bank_account/models/card_model.dart';
import 'package:annale_driver/modules/bank_account/views/add_account_screen.dart';
import 'package:annale_driver/modules/bank_account/views/payment_screen.dart';
import 'package:annale_driver/modules/bank_account/widgets/bank_account_tile.dart';
import 'package:annale_driver/modules/wallet/widgets/wallet_balance_box.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SelectBankSection extends StatefulWidget {
  const SelectBankSection({super.key});

  @override
  State<SelectBankSection> createState() => _SelectBankSectionState();
}

class _SelectBankSectionState extends State<SelectBankSection> {
  String _enteredNumber = '';

  void _onButtonPressed(String value) {
    setState(() {
      if (value == 'clear') {
        if (_enteredNumber.isNotEmpty) {
          _enteredNumber = _enteredNumber.substring(
            0,
            _enteredNumber.length - 1,
          );
        }
      } else if (value == '.') {
        if (!_enteredNumber.contains('.') && _enteredNumber.isNotEmpty) {
          _enteredNumber += value;
        } else if (_enteredNumber.isEmpty) {
          _enteredNumber = '0.';
        }
      } else {
        _enteredNumber += value;
      }
    });
  }

  Widget _buildNumberButton(String text) {
    return GestureDetector(
      onTap: () => _onButtonPressed(text),
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(),
        child: AppText(
          text: text,
          fontSize: 22.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryDark,
        ),
      ),
    );
  }

  Widget _buildBackspaceButton() {
    return GestureDetector(
      onTap: () => _onButtonPressed('clear'),
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(),
        child: const Icon(
          Icons.backspace_outlined,
          size: 30,
          color: Color(0xFF4A4A4A),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PaymentController());
    return Scaffold(
      // backgroundColor: const Colors.w,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Container(
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
                              text: "Withdrawn Amount".tr,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color(0xff151518),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            AppText(
                              text: "100.00 HTG",
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
                                  print('object');
                                  Get.back();
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AppText(
                                      text: "Change",
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
              ),
            ),
            AppSpacing.height16,

            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 2),
                decoration: BoxDecoration(
                  gradient: AppGradients.green,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 22.w),
                  decoration: BoxDecoration(
                    gradient: AppGradients.black,
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r),
                    ),
                  ),
                  child: Column(
                    children: [
                      AppSpacing.height16,
                      AppText(
                        text: "Select Bank Account",
                        fontWeight: FontWeight.bold,
                      ),
                      AppSpacing.height16,

                      const SizedBox(height: 40),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(),
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
                                          controller.selectedCardId.value ==
                                          card.id,
                                      onTap: () =>
                                          controller.selectCard(card.id),
                                    );
                                  },
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      AppButton(
                        callback: () {
                          Get.to(() => AddAccountScreen());
                        },
                        text1: "ADD NEW BANK ACCOUNT",
                        radius: 50,
                        height: 45.h,
                        showBorder: true,
                        fontSize: 14.sp,
                      ),
                      AppSpacing.height8,
                      AppButton(
                        text1: "WITHDRAW",
                        radius: 50,
                        height: 45.h,
                        showBorder: true,
                        fontSize: 14.sp,
                      ),
                      AppSpacing.height16,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
