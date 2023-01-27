import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/blocs/blocs.dart';

import 'screens/screens.dart';

abstract class AppRouter {
  static final routes = <String, WidgetBuilder>{
    HomeScreen.path: (_) => const HomeScreen(),
    LandingScreen.path: (_) => BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(),
          child: const LandingScreen(),
        ),
    WeatherScreen.path: (_) => const WeatherScreen(),
  };
}
