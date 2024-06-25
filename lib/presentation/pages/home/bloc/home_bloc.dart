import 'package:desafio_prominas_app/data/datasource/remote/services/course_service.dart';
import 'package:desafio_prominas_app/data/repository/course_repository.dart';
import 'package:desafio_prominas_app/domain/use_cases/get_courses_usecase.dart';
import 'package:desafio_prominas_app/domain/utils/resource.dart';
import 'package:desafio_prominas_app/presentation/pages/home/bloc/home_event.dart';
import 'package:desafio_prominas_app/presentation/pages/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetCoursesUsecase getCoursesUsecase = GetCoursesUsecase(
    courseRepository: CourseRepository(
      courseService: CourseService(),
    ),
  );

  HomeBloc() : super(const HomeState()) {
    on<HomeInitial>(_onInit);
  }

  Future<void> _onInit(HomeInitial event, Emitter<HomeState> emit) async {
    emit(state.copyWith(response: Loading()));

    Resource response = await getCoursesUsecase.run();

    emit(state.copyWith(response: response));
  }
}
