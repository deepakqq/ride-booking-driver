import 'package:annale_driver/modules/bank_account/repository/payment_repo.dart';
import 'package:get/get.dart';
import '../models/card_model.dart';

class PaymentController extends GetxController {
  final repo = PaymentRepo();
  final banks = <BankModel>[].obs;
  final selectedCardId = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadCards();
  }

  void loadCards() async {
    final result = await repo.fetchCards();
    banks.value = result;
    selectedCardId.value =
        result.firstWhereOrNull((card) => card.isDefault)?.id ?? '';
  }

  void selectCard(String id) {
    selectedCardId.value = id;
  }
}
