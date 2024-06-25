import 'package:desafio_prominas_app/presentation/utils/form_item.dart';

abstract class LoginEvent {}

class LoginInit extends LoginEvent {}

class EmailChanged extends LoginEvent {
  final FormItem email;

  EmailChanged({required this.email});
}

class PasswordChanged extends LoginEvent {
  final FormItem password;

  PasswordChanged({required this.password});
}

class SaveAccessToken extends LoginEvent {
  final String token;

  SaveAccessToken({required this.token});
}

class GetUserProfile extends LoginEvent {
  final String token;

  GetUserProfile({required this.token});
}

class Logout extends LoginEvent {}

class LoginSubmit extends LoginEvent {}
