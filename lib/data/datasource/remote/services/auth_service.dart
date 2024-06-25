import 'dart:developer' as developer;

import 'package:desafio_prominas_app/domain/model/auth_response.dart';
import 'package:desafio_prominas_app/domain/model/user_response.dart';
import 'package:desafio_prominas_app/domain/utils/list_to_string.dart';
import 'package:desafio_prominas_app/domain/utils/resource.dart';
import 'package:dio/dio.dart';

class AuthService {
  final Dio dio;

  AuthService()
      : dio = Dio(BaseOptions(
          baseUrl: 'https://desafio-prominas-backend.sdyuho.easypanel.host',
        ));

  Future<Resource<AuthResponse>> login({
    required String email,
    required String password,
    String? deviceToken,
  }) async {
    try {
      final response = await dio.post('/auth/login', data: {
        'email': email,
        'password': password,
        'deviceToken': deviceToken,
      });

      AuthResponse authResponse = AuthResponse.fromJson(response.data);

      return Success(data: authResponse);
    } on DioException catch (e) {
      developer.log(e.toString());
      return ErrorResponse(message: listToString(e.response!.data['message']));
    } catch (e) {
      developer.log(e.toString());
      return ErrorData(message: e.toString());
    }
  }

  Future<Resource<UserResponse>> getProfile({required String token}) async {
    try {
      final response = await dio.get('/student/profile',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            },
          ));

      UserResponse userResponse = UserResponse.fromJson(response.data);

      return Success(data: userResponse);
    } on DioException catch (e) {
      developer.log(e.toString());
      return ErrorResponse(message: listToString(e.response!.data['message']));
    } catch (e) {
      developer.log(e.toString());
      return ErrorData(message: e.toString());
    }
  }
}
