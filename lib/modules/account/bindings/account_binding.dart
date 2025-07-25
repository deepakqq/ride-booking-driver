import 'package:annale_driver/modules/account/repository/account_repo.dart';
import 'package:get/get.dart';
import '../controllers/account_controller.dart';

class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountRepository());
    Get.lazyPut(() => AccountController(Get.find<AccountRepository>()));
  }
}
