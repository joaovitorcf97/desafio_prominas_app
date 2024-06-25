// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:desafio_prominas_app/data/datasource/remote/services/course_service.dart';
import 'package:desafio_prominas_app/domain/repository/course_repository.dart';

import '../../domain/model/course_response.dart';
import '../../domain/model/discipline_response.dart';
import '../../domain/utils/resource.dart';

class CourseRepository implements ICourseRepository {
  CourseService courseService;

  CourseRepository({required this.courseService});

  @override
  Future<Resource<List<CourseResponse>>> getAllCourses() async {
    return await courseService.getCouses();
  }

  @override
  Future<Resource<CourseResponse>> getCourse({required String courseId}) async {
    return await courseService.getCourse(id: courseId);
  }

  @override
  Future<Resource<Disciplene>> getDisciplines({
    required String disciplineId,
  }) async {
    return await courseService.getDiscipline(id: disciplineId);
  }
}
