import 'package:annale_driver/modules/business_home/controllers/business_home_controller.dart';
import 'package:get/get.dart';

class BusinessHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BusinessHomeController>(
      () => BusinessHomeController(),
      fenix: true,
    );
  }
}
