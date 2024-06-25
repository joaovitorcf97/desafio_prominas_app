import 'package:desafio_prominas_app/data/datasource/local/shared_prefs.dart';
import 'package:desafio_prominas_app/data/datasource/remote/services/auth_service.dart';
import 'package:desafio_prominas_app/domain/model/auth_response.dart';
import 'package:desafio_prominas_app/domain/model/user_response.dart';
import 'package:desafio_prominas_app/domain/repository/auth_repository.dart';
import 'package:desafio_prominas_app/domain/utils/resource.dart';

class AuthRepository implements IAuthRepository {
  AuthService authService;
  SharedPrefs sharedPrefs;

  AuthRepository({required this.authService, required this.sharedPrefs});

  @override
  Future<Resource<AuthResponse>> login({
    required String email,
    required String password,
    String? deviceToken,
  }) async {
    return authService.login(
      email: email,
      password: password,
      deviceToken: deviceToken,
    );
  }

  @override
  Future<Resource<UserResponse>> getProfile({required String token}) {
    return authService.getProfile(token: token);
  }

  @override
  Future<String?> getAccessToken() async {
    final accessToken = await sharedPrefs.read('access_token');

    if (accessToken != null) {
      return accessToken;
    }

    return null;
  }

  @override
  Future<void> saveAccessToken({required String token}) async {
    await sharedPrefs.save('access_token', token);
  }

  @override
  Future<bool> logout() async {
    return await sharedPrefs.remove('access_token');
  }
}
