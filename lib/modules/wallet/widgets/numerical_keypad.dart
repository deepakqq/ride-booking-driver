import 'package:annale_driver/core/theme/app_colors.dart';
import 'package:annale_driver/core/theme/app_gradient.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/wallet/widgets/wallet_balance_box.dart';
import 'package:annale_driver/widgets/app_button.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NumericalKeypadWidget extends StatefulWidget {
  const NumericalKeypadWidget({super.key});

  @override
  State<NumericalKeypadWidget> createState() => _NumericalKeypadWidgetState();
}

class _NumericalKeypadWidgetState extends State<NumericalKeypadWidget> {
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
    return Scaffold(
      // backgroundColor: const Colors.w,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: WalletBalanceBox(),
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
                      Container(
                        width: Get.width - 100.w,

                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: AppColors.primary),
                        ),
                        child: AppText(
                          text: _enteredNumber.isEmpty ? '0' : _enteredNumber,
                          align: TextAlign.center,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryDark,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 25.0,
                                  mainAxisSpacing: 25.0,
                                  childAspectRatio: 1.5,
                                ),
                            itemCount: 12,
                            itemBuilder: (context, index) {
                              if (index < 9) {
                                return _buildNumberButton('${index + 1}');
                              } else if (index == 9) {
                                return _buildNumberButton('.');
                              } else if (index == 10) {
                                return _buildNumberButton('0');
                              } else {
                                return _buildBackspaceButton();
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      AppButton(
                        text1: "CONTINUE",
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
