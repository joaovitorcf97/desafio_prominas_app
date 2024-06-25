import 'package:desafio_prominas_app/data/datasource/remote/services/auth_service.dart';
import 'package:desafio_prominas_app/domain/use_cases/logout_usecase.dart';
import 'package:desafio_prominas_app/domain/utils/resource.dart';
import 'package:desafio_prominas_app/presentation/widgets/profile/bloc/profile_event.dart';
import 'package:desafio_prominas_app/presentation/widgets/profile/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/datasource/local/shared_prefs.dart';
import '../../../../data/repository/auth_repository.dart';
import '../../../../domain/use_cases/get_access_token_usecase.dart';
import '../../../../domain/use_cases/get_user_logged.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
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

  LogoutUsecase logoutUsecase = LogoutUsecase(
    authRepository: AuthRepository(
      authService: AuthService(),
      sharedPrefs: SharedPrefs(),
    ),
  );

  ProfileBloc() : super(const ProfileState()) {
    on<ProfileInitEvent>(_onInit);
    on<LogoutEvent>(_onLogout);
  }

  Future<void> _onInit(
    ProfileInitEvent event,
    Emitter<ProfileState> emit,
  ) async {
    String? token = await getAccessTokenUsecase.run();
    emit(state.copyWith(response: Loading()));

    if (token != null) {
      final response = await getUserLogged.run(token);

      emit(state.copyWith(response: response));
    }
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<ProfileState> emit) async {
    await logoutUsecase.run();
  }
}
