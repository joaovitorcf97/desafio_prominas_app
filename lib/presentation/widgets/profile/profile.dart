import 'package:desafio_prominas_app/domain/utils/resource.dart';
import 'package:desafio_prominas_app/presentation/widgets/profile/bloc/profile_bloc.dart';
import 'package:desafio_prominas_app/presentation/widgets/profile/bloc/profile_event.dart';
import 'package:desafio_prominas_app/presentation/widgets/profile/bloc/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_initicon/flutter_initicon.dart';

import '../../../main.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        final response = state.response;

        if (response is Loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (response is Success) {
          return AppBar(
            backgroundColor: Colors.transparent,
            title: Row(
              children: [
                Initicon(
                  text: response.data.name,
                  backgroundColor: Color(0xFFED8A6F),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Olá ${response.data.name}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Bem vindo de volta',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {
                  context.read<ProfileBloc>().add(LogoutEvent());
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const MyApp()),
                      (route) => false);
                },
                icon: const Icon(Icons.logout_outlined),
              ),
            ],
          );
        }

        return const Center(child: Text('Error inesperado!'));
      },
    );
  }
}
