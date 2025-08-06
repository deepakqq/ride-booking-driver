import 'package:annale_driver/modules/auth/controllers/auth_controller.dart';
import 'package:annale_driver/modules/auth/repository/auth_repository.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRepository());
    Get.lazyPut<AuthController>(
      () => AuthController(authRepository: Get.find<AuthRepository>()),
    );
  }
}
