import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/blocs/blocs.dart';
import 'package:weather/models/nav_arguments/home_screen_nav_argument.dart';

import 'screens/screens.dart';

abstract class AppRouter {
  static final routes = <String, WidgetBuilder>{
    HomeScreen.path: (BuildContext context) {
      final navParam =
          ModalRoute.of(context)!.settings.arguments as HomeScreenNavArgument;

      return HomeScreen(
        user: navParam.user,
      );
    },
    LandingScreen.path: (_) => BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(),
          child: const LandingScreen(),
        ),
    WeatherScreen.path: (_) => const WeatherScreen(),
  };
}
