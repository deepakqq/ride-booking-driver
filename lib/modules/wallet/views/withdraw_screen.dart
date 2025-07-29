import 'package:annale_driver/modules/wallet/widgets/numerical_keypad.dart';
import 'package:annale_driver/modules/wallet/widgets/wallet_balance_box.dart';
import 'package:annale_driver/widgets/app_normal_appbar.dart';
import 'package:flutter/material.dart';

class WithdrawScreen extends StatelessWidget {
  const WithdrawScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NumericalKeypadWidget(),
      appBar: AppNormalAppBar(title: "Withdraw"),
    );
  }
}
