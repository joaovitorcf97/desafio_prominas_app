// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:desafio_prominas_app/domain/utils/resource.dart';
import 'package:equatable/equatable.dart';

class CourseDetailState extends Equatable {
  final String courseId;
  final Resource? response;

  const CourseDetailState({
    this.courseId = '',
    this.response,
  });

  @override
  List<Object?> get props => [response, courseId];

  CourseDetailState copyWith({
    String? courseId,
    Resource? response,
  }) {
    return CourseDetailState(
      courseId: courseId ?? this.courseId,
      response: response ?? this.response,
    );
  }
}
