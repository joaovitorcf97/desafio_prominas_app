import 'package:desafio_prominas_app/data/datasource/remote/services/firebase_service.dart';
import 'package:desafio_prominas_app/firebase_options.dart';
import 'package:desafio_prominas_app/presentation/pages/auth/bloc/login_bloc.dart';
import 'package:desafio_prominas_app/presentation/pages/auth/bloc/login_event.dart';
import 'package:desafio_prominas_app/presentation/pages/auth/login_page.dart';
import 'package:desafio_prominas_app/presentation/pages/course_detail/bloc/course_detail_bloc.dart';
import 'package:desafio_prominas_app/presentation/pages/course_detail/bloc/course_detail_event.dart';
import 'package:desafio_prominas_app/presentation/pages/course_detail/course_detail_page.dart';
import 'package:desafio_prominas_app/presentation/pages/home/bloc/home_bloc.dart';
import 'package:desafio_prominas_app/presentation/pages/home/bloc/home_event.dart';
import 'package:desafio_prominas_app/presentation/pages/home/home_page.dart';
import 'package:desafio_prominas_app/presentation/pages/loading/bloc/loading_bloc.dart';
import 'package:desafio_prominas_app/presentation/pages/loading/bloc/loading_event.dart';
import 'package:desafio_prominas_app/presentation/pages/loading/loading_page.dart';
import 'package:desafio_prominas_app/presentation/utils/app_routes.dart';
import 'package:desafio_prominas_app/presentation/widgets/profile/bloc/profile_bloc.dart';
import 'package:desafio_prominas_app/presentation/widgets/profile/bloc/profile_event.dart';
import 'package:desafio_prominas_app/presentation/widgets/profile/profile.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  await FirebaseService().initNotification();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoadingBloc()..add(LoadingInitEvent()),
          child: const LoadingPage(),
        ),
        BlocProvider(
          create: (context) => LoginBloc()..add(LoginInit()),
          child: const LoginPage(),
        ),
        BlocProvider(
          create: (context) => ProfileBloc()..add(ProfileInitEvent()),
          child: const Profile(),
        ),
        BlocProvider(
          create: (context) => HomeBloc()..add(HomeInitial()),
          child: const HomePage(),
        ),
        BlocProvider(
          create: (context) => CourseDetailBloc()..add(CourseDetailInit()),
          child: const CourseDetailPagel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Desafio Prominas',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFED8A6F)),
          useMaterial3: true,
          fontFamily: 'Poppins',
          scaffoldBackgroundColor: const Color(0xfffff2e0),
        ),
        initialRoute: Routes.loadingPage,
        routes: {
          Routes.loadingPage: (context) => const LoadingPage(),
          Routes.loginPage: (context) => const LoginPage(),
          Routes.homePage: (context) => const HomePage(),
          Routes.courseDetailPage: (context) => const CourseDetailPagel(),
        },
      ),
    );
  }
}
