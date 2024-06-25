import 'package:bloc/bloc.dart';
import 'package:desafio_prominas_app/data/datasource/local/shared_prefs.dart';
import 'package:desafio_prominas_app/presentation/pages/loading/bloc/loading_event.dart';
import 'package:desafio_prominas_app/presentation/pages/loading/bloc/loading_state.dart';

import '../../../../data/datasource/remote/services/auth_service.dart';
import '../../../../data/repository/auth_repository.dart';
import '../../../../domain/use_cases/get_access_token_usecase.dart';
import '../../../../domain/use_cases/get_user_logged.dart';
import '../../../../domain/utils/resource.dart';

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  GetUserLogged getUserLogged = GetUserLogged(
    authRepository: AuthRepository(
      authService: AuthService(),
      sharedPrefs: SharedPrefs(),
    ),
  );

  GetAccessTokenUsecase getAccessTokenUsecase = GetAccessTokenUsecase(
    authRepository: AuthRepository(
      authService: AuthService(),
      sharedPrefs: SharedPrefs(),
    ),
  );

  LoadingBloc() : super(const LoadingState()) {
    on<LoadingInitEvent>(_onInit);
  }

  Future<void> _onInit(
    LoadingInitEvent event,
    Emitter<LoadingState> emit,
  ) async {
    String? token = await getAccessTokenUsecase.run();
    emit(state.copyWith(response: Loading(), withoutToken: false));

    if (token != null) {
      final response = await getUserLogged.run(token);

      emit(state.copyWith(response: response, withoutToken: false));
    } else {
      emit(state.copyWith(response: null, withoutToken: true));
    }
  }
}
