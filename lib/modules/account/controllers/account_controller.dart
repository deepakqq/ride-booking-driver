import 'package:annale_driver/modules/account/repository/account_repo.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  final AccountRepository _accountRepo;

  AccountController(this._accountRepo);

  var isLoading = false.obs;
  var isDarkMode = false.obs;
  var userName = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAccountData();
  }

  Future<void> fetchAccountData() async {
    try {
      isLoading.value = true;
      final name = await _accountRepo.getUserName();
      userName.value = name;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load user data');
    } finally {
      isLoading.value = false;
    }
  }
}
