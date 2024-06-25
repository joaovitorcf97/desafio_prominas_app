// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer' as developer;

import 'package:desafio_prominas_app/domain/model/course_response.dart';
import 'package:desafio_prominas_app/domain/model/discipline_response.dart';
import 'package:desafio_prominas_app/domain/utils/resource.dart';
import 'package:dio/dio.dart';

import '../../../../domain/utils/list_to_string.dart';

class CourseService {
  final Dio dio;

  CourseService()
      : dio = Dio(BaseOptions(
          baseUrl: 'https://desafio-prominas-backend.sdyuho.easypanel.host',
        ));

  Future<Resource<List<CourseResponse>>> getCouses() async {
    try {
      final response = await dio.get('/course');
      final rawList = response.data as List;

      List<CourseResponse> courseResponse =
          rawList.map((e) => CourseResponse.fromJson(e)).toList();

      return Success(data: courseResponse);
    } on DioException catch (e) {
      developer.log(e.toString());
      return ErrorResponse(message: listToString(e.response!.data['message']));
    } catch (e) {
      developer.log(e.toString());
      return ErrorData(message: e.toString());
    }
  }

  Future<Resource<CourseResponse>> getCourse({required String id}) async {
    try {
      final response = await dio.get('/course/$id');

      CourseResponse courseResponse = CourseResponse.fromJson(response.data);

      return Success(data: courseResponse);
    } on DioException catch (e) {
      developer.log(e.toString());
      return ErrorResponse(message: listToString(e.response!.data['message']));
    } catch (e) {
      developer.log(e.toString());
      return ErrorData(message: e.toString());
    }
  }

  Future<Resource<Disciplene>> getDiscipline({required String id}) async {
    try {
      final response = await dio.get('/course/discipline/$id');

      Disciplene disciplene = Disciplene.fromJson(response.data);

      return Success(data: disciplene);
    } on DioException catch (e) {
      developer.log(e.toString());
      return ErrorResponse(message: listToString(e.response!.data['message']));
    } catch (e) {
      developer.log(e.toString());
      return ErrorData(message: e.toString());
    }
  }
}
