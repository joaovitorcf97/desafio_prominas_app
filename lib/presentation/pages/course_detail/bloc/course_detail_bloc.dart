import 'package:desafio_prominas_app/data/datasource/remote/services/course_service.dart';
import 'package:desafio_prominas_app/data/repository/course_repository.dart';
import 'package:desafio_prominas_app/domain/use_cases/get_course_usecase.dart';
import 'package:desafio_prominas_app/presentation/pages/course_detail/bloc/course_detail_event.dart';
import 'package:desafio_prominas_app/presentation/pages/course_detail/bloc/course_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/utils/resource.dart';

class CourseDetailBloc extends Bloc<CourseDetailEvent, CourseDetailState> {
  GetCourseUsecase getCourseUsecase = GetCourseUsecase(
    courseRepository: CourseRepository(
      courseService: CourseService(),
    ),
  );

  CourseDetailBloc() : super(const CourseDetailState()) {
    on<CourseDetailInit>(_onInit);
    on<CourseDetailLoaded>(_onloaded);
  }

  Future<void> _onInit(
    CourseDetailInit event,
    Emitter<CourseDetailState> emit,
  ) async {
    emit(state.copyWith(response: Loading()));
  }

  Future<void> _onloaded(
    CourseDetailLoaded event,
    Emitter<CourseDetailState> emit,
  ) async {
    Resource response = await getCourseUsecase.run(event.id);

    emit(state.copyWith(response: response));
  }
}
