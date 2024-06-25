import 'package:desafio_prominas_app/domain/utils/resource.dart';
import 'package:desafio_prominas_app/presentation/pages/auth/bloc/login_bloc.dart';
import 'package:desafio_prominas_app/presentation/pages/auth/bloc/login_event.dart';
import 'package:desafio_prominas_app/presentation/pages/auth/bloc/login_state.dart';
import 'package:desafio_prominas_app/presentation/utils/form_item.dart';
import 'package:desafio_prominas_app/presentation/widgets/app_button.dart';
import 'package:desafio_prominas_app/presentation/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../utils/app_routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFED8A6F),
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          final response = state.response;
          if (response is Success) {
            context
                .read<LoginBloc>()
                .add(SaveAccessToken(token: response.data.accessToken));

            Navigator.pushReplacementNamed(context, Routes.homePage);
          }

          if (response is ErrorResponse) {
            Fluttertoast.showToast(
              msg: response.message,
              toastLength: Toast.LENGTH_SHORT,
            );
          }

          if (response is ErrorData) {
            Fluttertoast.showToast(
              msg: response.message,
              toastLength: Toast.LENGTH_SHORT,
            );
          }
        },
        builder: (context, state) {
          final response = state.response;

          return Stack(
            fit: StackFit.expand,
            children: [
              const Image(image: AssetImage('assets/images/person3d.png')),
              Positioned(
                bottom: 0,
                child: Form(
                  key: state.formKey,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.0, 0.3],
                      colors: [
                        const Color(0xFFED8A6F).withOpacity(0),
                        const Color(0xFFED8A6F),
                      ],
                    )),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .5,
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Bem vindo!',
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Entre com suas credenciais',
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[100]),
                        ),
                        const SizedBox(height: 34),
                        AppTextField(
                          text: 'E-mail',
                          icon: Icons.email_outlined,
                          onChanged: (value) {
                            context.read<LoginBloc>().add(
                                EmailChanged(email: FormItem(value: value)));
                          },
                          validator: (value) {
                            return state.email.error;
                          },
                        ),
                        const SizedBox(height: 16),
                        AppTextField(
                          text: 'Senha',
                          isPassword: true,
                          icon: Icons.lock_outline,
                          onChanged: (value) {
                            context.read<LoginBloc>().add(PasswordChanged(
                                password: FormItem(value: value)));
                          },
                          validator: (value) {
                            return state.password.error;
                          },
                        ),
                        const SizedBox(height: 24),
                        AppButton(
                          onTap: () {
                            if (state.formKey!.currentState!.validate()) {
                              context.read<LoginBloc>().add(LoginSubmit());
                            }
                          },
                          loading: response is Loading,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
