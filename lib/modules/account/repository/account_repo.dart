class AccountRepository {
  // Normally here you'd use Dio, HTTP, etc.
  Future<String> getUserName() async {
    // Simulated API call or DB fetch
    await Future.delayed(Duration(seconds: 1));
    return 'John Doe';
  }
}
