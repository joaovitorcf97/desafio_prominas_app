import 'package:desafio_prominas_app/data/repository/auth_repository.dart';

class GetUserLogged {
  AuthRepository authRepository;

  GetUserLogged({required this.authRepository});

  run(String token) => authRepository.getProfile(token: token);
}
