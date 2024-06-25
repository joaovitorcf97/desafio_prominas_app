abstract class IAuthRepository {
  Future<void> login({
    required String email,
    required String password,
    String? deviceToken,
  });
  Future<void> getProfile({required String token});
  Future<void> saveAccessToken({required String token});
  Future<String?> getAccessToken();
  Future<bool> logout();
}
