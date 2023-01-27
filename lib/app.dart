import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/repositories/repositories.dart';

import 'blocs/blocs.dart';
import 'router.dart';
import 'screens/screens.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return _RepositoryProviders(
      child: _BlocProviders(
        child: MaterialApp(
          title: 'Weather App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: LandingScreen.path,
          routes: AppRouter.routes,
        ),
      ),
    );
  }
}

//------------------------------------------------------------------------------
class _BlocProviders extends StatelessWidget {
  const _BlocProviders({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(),
        ),
      ],
      child: child,
    );
  }
}

//------------------------------------------------------------------------------
class _RepositoryProviders extends StatelessWidget {
  const _RepositoryProviders({
    required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<WeatherRepository>(
          create: (_) => OpenWeatherRepository(),
        ),
      ],
      child: child,
    );
  }
}
