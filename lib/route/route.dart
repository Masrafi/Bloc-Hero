import 'package:bdtender_bloc/bloc/login_bloc/login_bloc.dart';
import 'package:bdtender_bloc/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/internet_bloc/internet_cubit.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/login":
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<InternetCubit>(
                create: (context) => InternetCubit(),
              ),
              BlocProvider<LogInBloc>(
                create: (context) => LogInBloc(),
              )
            ],
            child: LoginScreen(),
          ),
        );

      //
      // case "/internet":
      //   Map<String, dynamic> arguments =
      //   settings.arguments as Map<String, dynamic>;
      //   return MaterialPageRoute(
      //     builder: (context) => BlocProvider(
      //       create: (context) => InternetCubit(),
      //       child: InternetHome(
      //         email: arguments["title"],
      //         pass: arguments["pass"],
      //       ),
      //     ),
      //   );
      //
      // case "/signup":
      //   return MaterialPageRoute(
      //     builder: (context) => BlocProvider(
      //       create: (context) => SignUpBloc(),
      //       child: SignUpScreen(),
      //     ),
      //   );
      //
      // case "/viewdata":
      //   Map<String, dynamic> arguments =
      //   settings.arguments as Map<String, dynamic>;
      //   return MaterialPageRoute(
      //     builder: (context) => ViewData(
      //       fname: arguments["fname"],
      //       lname: arguments["lname"],
      //       email: arguments["email"],
      //       pass: arguments["pass"],
      //     ),
      //   );
      //
      // case "/apihome":
      //   return MaterialPageRoute(
      //     builder: (context) => RepositoryProvider(
      //       create: (context) => Repository(),
      //       child: ApiHomeScreen(),
      //     ),
      //   );
      //
      // case "/viewdataAPI":
      //   Map<String, dynamic> arguments =
      //   settings.arguments as Map<String, dynamic>;
      //   return MaterialPageRoute(
      //     builder: (context) => ViewDataAPI(
      //       model: arguments['model'],
      //     ),
      //   );
      //
      // case "/httppost":
      //   return MaterialPageRoute(
      //     builder: (context) => RepositoryProvider(
      //       create: (context) => ProductRepository(),
      //       child: HttpCheck(),
      //     ),
      //   );

      // case "/calldata":
      //   return MaterialPageRoute(
      //     builder: (context) => BlocProvider(
      //       create: (context) => ProductBloc(productRepository: ),
      //       child: SignUpScreen(),
      //     ),
      //   );

      default:
        return null;
    }
  }
}
