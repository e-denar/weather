import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/blocs/home/home_bloc.dart';

import '../common/common.dart';
import '../models/models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.user,
  });

  static const path = '/home';

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.cloud),
        actions: [
          TextButton(
            onPressed: () {
              // TODO
            },
            child: const Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final Widget child;
          switch (state.status) {
            case Status.loading:
              child = const Center(
                child: CircularProgressIndicator(),
              );
              break;
            case Status.init:
              child = const _SearchWeather();
              break;
            case Status.success:
              child = const _WeatherResult();
              break;
            case Status.error:
              child = const _FailedResult();
              break;
          }

          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 125),
            child: child,
          );
        },
      ),
    );
  }
}

//------------------------------------------------------------------------------
class _SearchWeather extends StatefulWidget {
  const _SearchWeather();

  @override
  State<_SearchWeather> createState() => _SearchWeatherState();
}

class _SearchWeatherState extends State<_SearchWeather> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 80),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: 'City',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              if (_controller.text.isEmpty) {
                return;
              }

              context.read<HomeBloc>().add(HomeSearchEvent(_controller.text));
            },
            child: const Text('Display Weather'),
          ),
        ],
      ),
    );
  }
}

//------------------------------------------------------------------------------
class _WeatherResult extends StatelessWidget {
  const _WeatherResult();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

//------------------------------------------------------------------------------
class _FailedResult extends StatelessWidget {
  const _FailedResult();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
