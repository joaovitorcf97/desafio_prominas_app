import 'package:desafio_prominas_app/domain/utils/resource.dart';
import 'package:desafio_prominas_app/presentation/pages/loading/bloc/loading_bloc.dart';
import 'package:desafio_prominas_app/presentation/pages/loading/bloc/loading_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/app_routes.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoadingBloc, LoadingState>(
      listener: (context, state) {
        final response = state.response;

        if (response is ErrorResponse || response is ErrorData) {
          Navigator.pushReplacementNamed(context, Routes.loginPage);
        }

        if (response is Success) {
          Navigator.pushReplacementNamed(context, Routes.homePage);
        }

        if (state.withoutToken) {
          Navigator.pushReplacementNamed(context, Routes.loginPage);
        }
      },
      builder: (context, state) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
