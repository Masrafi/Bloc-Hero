import 'package:bdtender_bloc/bloc/internet_bloc/internet_cubit.dart';
import 'package:bdtender_bloc/bloc/spalsh_bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'route/route.dart';
import 'screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Routes.onGenerateRoute,
      home: BlocProvider(
        create: (context) => SplashBloc(),
        child: SplashScreen(),
      ),
    );
  }
}
