import 'package:annale_driver/modules/wallet/controllers/wallet_controller.dart';
import 'package:annale_driver/modules/wallet/widgets/numerical_keypad.dart';
import 'package:annale_driver/modules/wallet/widgets/select_bank_section.dart';
import 'package:annale_driver/modules/wallet/widgets/wallet_balance_box.dart';
import 'package:annale_driver/widgets/app_normal_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WithdrawScreen extends StatelessWidget {
  const WithdrawScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WalletController walletController = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      body: walletController.showSelectBankSection.value
          ? SelectBankSection()
          : NumericalKeypadWidget(),
      appBar: AppNormalAppBar(title: "Withdraw"),
    );
  }
}
