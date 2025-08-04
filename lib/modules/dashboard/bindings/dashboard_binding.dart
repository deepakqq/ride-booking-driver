import 'package:annale_driver/modules/account/controllers/account_controller.dart';
import 'package:annale_driver/modules/account/repository/account_repo.dart';
import 'package:annale_driver/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:annale_driver/modules/home/controllers/ride_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => AccountRepository());
    Get.lazyPut(() => AccountController(Get.find<AccountRepository>()));
    Get.lazyPut<RideController>(() => RideController());
  }
}
