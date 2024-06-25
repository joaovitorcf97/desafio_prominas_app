import 'package:desafio_prominas_app/domain/repository/auth_repository.dart';

class LoginUsecase {
  IAuthRepository repository;

  LoginUsecase({required this.repository});

  run({required String email, required String password, String? deviceToken}) {
    return repository.login(
      email: email,
      password: password,
      deviceToken: deviceToken,
    );
  }
}
