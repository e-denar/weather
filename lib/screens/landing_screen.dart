import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import '../screens/screens.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  static const path = '/landing';

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          Navigator.of(context).pushNamed(HomeScreen.path);
        } else if (state.status.isError && state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage!.text),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.cloud),
          title: const Text('Weather Forecast'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome to the weather forecast web application. Please login with your Github user to use the application and view the weather in your city.',
              ),
              const SizedBox(height: 24),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      if (state.status.isLoading) {
                        return;
                      }

                      context.read<AuthBloc>().add(AuthLoginEvent());
                    },
                    child: !state.status.isLoading
                        ? const Text('Login')
                        : const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
