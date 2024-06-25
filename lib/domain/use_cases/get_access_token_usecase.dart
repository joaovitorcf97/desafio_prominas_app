// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:desafio_prominas_app/data/repository/auth_repository.dart';

class GetAccessTokenUsecase {
  AuthRepository authRepository;

  GetAccessTokenUsecase({required this.authRepository});

  run() => authRepository.getAccessToken();
}
