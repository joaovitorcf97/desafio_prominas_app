// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:desafio_prominas_app/domain/utils/resource.dart';
import 'package:desafio_prominas_app/presentation/utils/form_item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LoginState extends Equatable {
  final GlobalKey<FormState>? formKey;
  final FormItem email;
  final FormItem password;
  final Resource? response;

  const LoginState({
    this.email = const FormItem(error: 'Insira um e-mail'),
    this.password = const FormItem(error: 'Insira uma senha'),
    this.formKey,
    this.response,
  });

  LoginState copyWith({
    GlobalKey<FormState>? formKey,
    FormItem? email,
    FormItem? password,
    Resource? response,
  }) {
    return LoginState(
      formKey: formKey ?? this.formKey,
      email: email ?? this.email,
      password: password ?? this.password,
      response: response ?? this.response,
    );
  }

  @override
  List<Object?> get props => [email, password, response];
}
