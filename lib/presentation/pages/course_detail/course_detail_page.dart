import 'package:desafio_prominas_app/domain/utils/resource.dart';
import 'package:desafio_prominas_app/presentation/pages/course_detail/bloc/course_detail_bloc.dart';
import 'package:desafio_prominas_app/presentation/pages/course_detail/bloc/course_detail_event.dart';
import 'package:desafio_prominas_app/presentation/pages/course_detail/bloc/course_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/card_disciplenes.dart';

class CourseIdArgument {
  final String id;

  CourseIdArgument(this.id);
}

class CourseDetailPagel extends StatefulWidget {
  const CourseDetailPagel({super.key});

  @override
  State<CourseDetailPagel> createState() => _CourseDetailPagelState();
}

class _CourseDetailPagelState extends State<CourseDetailPagel> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as CourseIdArgument;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Disciplinas',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<CourseDetailBloc, CourseDetailState>(
        listener: (context, state) {
          final response = state.response;

          if (response is Loading) {
            context
                .read<CourseDetailBloc>()
                .add(CourseDetailLoaded(id: args.id));
          }
        },
        builder: (context, state) {
          final response = state.response;

          if (response is ErrorData || response is ErrorResponse) {
            return const Center(child: Text('Error!'));
          }

          if (response is Loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (response is Success) {
            return ListView.builder(
              itemCount: response.data.disciplenes.length,
              itemBuilder: (context, index) {
                return Disciplenes(
                  title: response.data.disciplenes[index].title,
                  description: response.data.disciplenes[index].description,
                  url: response.data.disciplenes[index].material,
                );
              },
            );
          }

          return const Center(child: Text('Error!'));
        },
      ),
    );
  }
}
