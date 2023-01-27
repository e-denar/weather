import 'package:flutter/material.dart';

import 'screens/screens.dart';

abstract class AppRouter {
  static final routes = <String, WidgetBuilder>{
    HomeScreen.path: (_) => const HomeScreen(),
    LandingScreen.path: (_) => const LandingScreen(),
    WeatherScreen.path: (_) => const WeatherScreen(),
  };
}
