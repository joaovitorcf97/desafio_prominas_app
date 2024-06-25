abstract class CourseDetailEvent {}

class CourseDetailInit extends CourseDetailEvent {}

class CourseDetailLoaded extends CourseDetailEvent {
  final String id;

  CourseDetailLoaded({required this.id});
}
