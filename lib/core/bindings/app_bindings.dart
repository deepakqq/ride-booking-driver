import 'package:annale_driver/modules/auth/controllers/auth_controller.dart';
import 'package:annale_driver/modules/auth/repository/auth_repository.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthRepository>(AuthRepository(), permanent: true);
    Get.put<AuthController>(
      AuthController(authRepository: Get.find<AuthRepository>()),
      permanent: true,
    );
  }
}
