import 'package:bdtender_bloc/bloc/login_bloc/login_bloc.dart';
import 'package:bdtender_bloc/bloc/registration/categoryGroup_bloc/categoryGroup_bloc.dart';
import 'package:bdtender_bloc/repository/corrigen_repo.dart';
import 'package:bdtender_bloc/repository/live_repo.dart';
import 'package:bdtender_bloc/repository/private_repo.dart';
import 'package:bdtender_bloc/repository/details_repo/todayTenderDetails_repo.dart';
import 'package:bdtender_bloc/repository/registration_repo/categoryGroup_repo.dart';
import 'package:bdtender_bloc/repository/registration_repo/relatedCategory_repo.dart';
import 'package:bdtender_bloc/repository/saveTenderShow.dart';
import 'package:bdtender_bloc/screen/home.dart';
import 'package:bdtender_bloc/screen/login_screen.dart';
import 'package:bdtender_bloc/screen/registration/category_group.dart';
import 'package:bdtender_bloc/screen/saveTenderShow_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/internet_bloc/internet_cubit.dart';
import '../repository/details_repo/corrigenTenderDetails_repo.dart';
import '../repository/details_repo/liveTenderDetails_repo.dart';
import '../repository/details_repo/privateTenderDetails_repo.dart';
import '../repository/today_repo.dart';
import '../screen/details_screen/corrigenTenderDetails_screen.dart';
import '../screen/details_screen/liveTenderDetails_screen.dart';
import '../screen/details_screen/privateTenderDetails_screen.dart';
import '../screen/details_screen/todayTenderDetails_screen.dart';
import '../screen/registration/registration_screen.dart';
import '../screen/registration/relatedCategory_screen.dart';

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
      case "/home":
        return MaterialPageRoute(
          builder: (context) => MultiRepositoryProvider(
            providers: [
              RepositoryProvider(
                create: (context) => RepositoryToday(),
              ),
              RepositoryProvider(
                create: (context) => RepositoryLive(),
              ),
              RepositoryProvider(
                create: (context) => RepositoryCorrigen(),
              ),
              RepositoryProvider(
                create: (context) => RepositoryPrivate(),
              ),
            ],
            child: Home(),
          ),
        );
      case "/todayDetails":
        return MaterialPageRoute(
          builder: (context) => RepositoryProvider(
            create: (context) => RepositoryTodayTenderDetails(),
            child: TodayTenderDetailsScreen(),
          ),
        );
      case "/corrigenDetails":
        return MaterialPageRoute(
          builder: (context) => RepositoryProvider(
            create: (context) => RepositoryCorrigenTenderDetails(),
            child: CorrigenTenderDetailsScreen(),
          ),
        );
      case "/privateDetails":
        return MaterialPageRoute(
          builder: (context) => RepositoryProvider(
            create: (context) => RepositoryPrivateTenderDetails(),
            child: PrivateTenderDetailsScreen(),
          ),
        );
      case "/liveDetails":
        return MaterialPageRoute(
          builder: (context) => RepositoryProvider(
            create: (context) => RepositoryLiveTenderDetails(),
            child: LiveTenderDetailsScreen(),
          ),
        );
      case "/savetendershow":
        return MaterialPageRoute(
          builder: (context) => RepositoryProvider(
            create: (context) => RepositorySaveTenderShow(),
            child: SaveTenderShowScreen(),
          ),
        );
      case "/registration":
        return MaterialPageRoute(
          builder: (context) => Registration(),
        );
      case "/categorygroup":
        Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => RepositoryProvider(
            create: (context) => RepositoryCategoryGroup(),
            child: CategoryGroup(
              namer: arguments["namer"],
              degicnation: arguments["degicnation"],
              organization: arguments["organization"],
              phoneNum: arguments["phoneNum"],
              emailFirst: arguments["emailFirst"],
              password: arguments["password"],
              group: arguments["group"],
            ),
          ),
        );
      case "/relatedgroup":
        return MaterialPageRoute(
          builder: (context) => RepositoryProvider(
            create: (context) => RepositoryRelatedCategory(),
            child: ReletedCategory(),
          ),
        );
      default:
        return null;
    }
  }
}
