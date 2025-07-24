abstract class AuthRepository {
  Future<void> login(String email, String password);
  Future<void> register(String name, String email, String password);
}

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<void> login(String email, String password) async {
    // 🚀 Replace with API call later
    await Future.delayed(Duration(seconds: 1));
    print("Login called with $email");
  }

  @override
  Future<void> register(String name, String email, String password) async {
    // 🚀 Replace with API call later
    await Future.delayed(Duration(seconds: 1));
    print("Register called with $email");
  }
}
