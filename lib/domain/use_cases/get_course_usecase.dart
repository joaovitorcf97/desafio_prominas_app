// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:desafio_prominas_app/data/repository/course_repository.dart';

class GetCourseUsecase {
  CourseRepository courseRepository;

  GetCourseUsecase({required this.courseRepository});

  run(String id) => courseRepository.getCourse(courseId: id);
}
