import 'package:annale_driver/modules/account/bindings/account_binding.dart';
import 'package:annale_driver/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    AccountBinding().dependencies();
  }
}
