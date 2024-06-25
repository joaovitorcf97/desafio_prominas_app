import 'package:bloc/bloc.dart';
import 'package:desafio_prominas_app/data/datasource/local/shared_prefs.dart';
import 'package:desafio_prominas_app/data/datasource/remote/services/auth_service.dart';
import 'package:desafio_prominas_app/data/repository/auth_repository.dart';
import 'package:desafio_prominas_app/domain/use_cases/get_access_token_usecase.dart';
import 'package:desafio_prominas_app/domain/use_cases/get_user_logged.dart';
import 'package:desafio_prominas_app/domain/use_cases/login_usecase.dart';
import 'package:desafio_prominas_app/domain/utils/resource.dart';
import 'package:desafio_prominas_app/presentation/pages/auth/bloc/login_event.dart';
import 'package:desafio_prominas_app/presentation/pages/auth/bloc/login_state.dart';
import 'package:desafio_prominas_app/presentation/utils/form_item.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../../../domain/use_cases/save_token_usecase.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final formKey = GlobalKey<FormState>();

  LoginUsecase loginUsecase = LoginUsecase(
    repository: AuthRepository(
      authService: AuthService(),
      sharedPrefs: SharedPrefs(),
    ),
  );

  SaveTokenUsecase saveAccessToken = SaveTokenUsecase(
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

  GetUserLogged getUserLogged = GetUserLogged(
    authRepository: AuthRepository(
      authService: AuthService(),
      sharedPrefs: SharedPrefs(),
    ),
  );

  LoginBloc() : super(const LoginState()) {
    on<LoginInit>(_initForm);
    on<EmailChanged>(_setEmail);
    on<PasswordChanged>(_setPassword);
    on<LoginSubmit>(_onLogin);
    on<SaveAccessToken>(_saveToken);
    on<GetUserProfile>(_getProfile);
  }

  Future<void> _initForm(LoginInit event, Emitter<LoginState> emit) async {
    emit(state.copyWith(formKey: formKey));
  }

  void _setEmail(EmailChanged event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        email: FormItem(
          value: event.email.value,
          error: event.email.value.isEmpty ? 'Enter e-mail' : null,
        ),
        formKey: formKey,
      ),
    );
  }

  void _setPassword(PasswordChanged event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        password: FormItem(
          value: event.password.value,
          error: event.password.value.isEmpty
              ? 'Enter password'
              : event.password.value.length < 6
                  ? 'Minimum 6 characters'
                  : null,
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onLogin(LoginSubmit event, Emitter<LoginState> emit) async {
    emit(state.copyWith(response: Loading(), formKey: formKey));

    FirebaseMessaging firebaseMessaging =
        FirebaseMessaging.instance; // Change here
    final token = await firebaseMessaging.getToken();

    final response = await loginUsecase.run(
      email: state.email.value,
      password: state.password.value,
      deviceToken: token,
    );

    emit(state.copyWith(response: response, formKey: formKey));
  }

  Future<void> _saveToken(
    SaveAccessToken event,
    Emitter<LoginState> emit,
  ) async {
    await saveAccessToken.run(event.token);
  }

  Future<void> _getProfile(
    GetUserProfile event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(response: Loading(), formKey: formKey));

    final response = await getUserLogged.run(event.token);

    emit(state.copyWith(response: response, formKey: formKey));
  }
}
