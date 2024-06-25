import 'package:desafio_prominas_app/domain/model/course_response.dart';
import 'package:desafio_prominas_app/presentation/pages/course_detail/course_detail_page.dart';
import 'package:desafio_prominas_app/presentation/pages/home/bloc/home_bloc.dart';
import 'package:desafio_prominas_app/presentation/pages/home/bloc/home_state.dart';
import 'package:desafio_prominas_app/presentation/pages/home/widgets/card_course.dart';
import 'package:desafio_prominas_app/presentation/utils/app_routes.dart';
import 'package:desafio_prominas_app/presentation/widgets/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../domain/utils/resource.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(58),
        child: Profile(),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          final response = state.response;

          if (response is ErrorData || response is ErrorResponse) {
            Fluttertoast.showToast(
              msg: 'Error',
              toastLength: Toast.LENGTH_SHORT,
            );
          }
        },
        builder: (context, state) {
          final response = state.response;

          if (response is ErrorData || response is ErrorResponse) {
            return const Center(child: Text('Error'));
          }

          if (response is Loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (response is Success) {
            final courses = response.data as List<CourseResponse>;

            return GridView.count(
              padding: const EdgeInsets.all(16),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              crossAxisCount: 2,
              children: List.generate(
                courses.length,
                (index) {
                  return CardCourse(
                    title: courses[index].title,
                    description: courses[index].description,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.courseDetailPage,
                        arguments: CourseIdArgument(courses[index].id),
                      );
                    },
                  );
                },
              ),
            );
          }

          return const Center(child: Text('Error'));
        },
      ),
    );
  }
}
