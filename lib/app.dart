import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/blocs.dart';
import 'common/common.dart';
import 'models/models.dart';
import 'repositories/repositories.dart';
import 'router.dart';
import 'screens/screens.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return _RepositoryProviders(
      child: _BlocProviders(
        child: MaterialApp(
          navigatorKey: GlobalKeys.navigatorKey,
          title: 'Weather App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: LandingScreen.path,
          routes: AppRouter.routes,
          builder: (context, child) => BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state.status.isSuccess) {
                Navigator.of(GlobalKeys.navigatorKey.currentState!.context)
                    .pushReplacementNamed(
                  HomeScreen.path,
                  arguments: HomeScreenNavArgument(
                    user: state.user!,
                  ),
                );
              } else if (state.status.isError && state.errorMessage != null) {
                ScaffoldMessenger.of(
                        GlobalKeys.navigatorKey.currentState!.context)
                    .showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage!.text),
                  ),
                );
              }
            },
            child: child,
          ),
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
