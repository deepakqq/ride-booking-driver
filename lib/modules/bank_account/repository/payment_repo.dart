// lib/modules/payment/repositories/payment_repo.dart
import 'package:annale_driver/core/values/app_images.dart';

import '../models/card_model.dart';

class PaymentRepo {
  Future<List<BankModel>> fetchCards() async {
    await Future.delayed(Duration(seconds: 1)); // fake API delay
    return [
      BankModel(
        id: '1',
        bankName: "American Bank",
        accountNumber: '**** **** **** 1234',
        imagePath: AppImages.aBank,
        isDefault: true,
      ),
      BankModel(
        bankName: "UN Bank",
        id: '2',
        accountNumber: '**** **** **** 4567',
        imagePath: AppImages.uBank,
      ),
      BankModel(
        bankName: "MonCash",
        id: '2',
        accountNumber: '**** **** **** 4567',
        imagePath: "assets/images/icons/icon-momo-c.png",
      ),
    ];
  }
}
