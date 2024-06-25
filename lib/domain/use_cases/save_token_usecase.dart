// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:desafio_prominas_app/data/repository/auth_repository.dart';

class SaveTokenUsecase {
  AuthRepository authRepository;

  SaveTokenUsecase({required this.authRepository});

  run(String token) => authRepository.saveAccessToken(token: token);
}
