import 'package:annale_driver/core/network/api_client.dart';

class AuthRepository {
  final ApiClient _apiClient = ApiClient();

  Future<dynamic> login(String email, String password) async {
    try {
      final response = await _apiClient.post(
        '/auth/login',
        data: {'email': email, 'password': password},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
