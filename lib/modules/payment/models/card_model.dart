// lib/modules/payment/models/card_model.dart
class BankModel {
  final String id;
  final String bankName;
  final String accountNumber;
  final String imagePath;
  final bool isDefault;

  BankModel({
    required this.bankName,
    required this.id,
    required this.accountNumber,
    required this.imagePath,
    this.isDefault = false,
  });
}
