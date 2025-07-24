import 'package:annale_driver/modules/auth/repository/auth_repository.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

  // Example login method
  Future<void> login(String email, String password) async {
    try {
      await authRepository.login(email, password);
    } catch (e) {
      print("Login failed: $e");
    }
  }
}
