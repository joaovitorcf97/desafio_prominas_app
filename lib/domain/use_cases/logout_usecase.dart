// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:desafio_prominas_app/data/repository/auth_repository.dart';

class LogoutUsecase {
  AuthRepository authRepository;

  LogoutUsecase({required this.authRepository});

  run() => authRepository.logout();
}
