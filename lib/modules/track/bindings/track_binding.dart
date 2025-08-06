import 'package:annale_driver/modules/auth/controllers/auth_controller.dart';
import 'package:annale_driver/modules/auth/repository/auth_repository.dart';
import 'package:annale_driver/modules/track/controllers/ride_controller.dart';
import 'package:get/get.dart';

class TrackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<trackController>(() => trackController());
  }
}
