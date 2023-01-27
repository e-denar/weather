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
              child = const _LoadingResult();
              break;
            case Status.init:
              child = const _SearchWeather();
              break;
            case Status.success:
              child = _WeatherResult(
                weather: state.weather!,
              );
              break;
            case Status.error:
              child = const _FailedResult();
              break;
          }

          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 50),
            child: child,
          );
        },
      ),
    );
  }
}

//------------------------------------------------------------------------------
class _LoadingResult extends StatelessWidget {
  const _LoadingResult({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 80),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
            ],
          ),
        ],
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
            onSubmitted: (_) => _onSubmit(),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _onSubmit,
            child: const Text('Display Weather'),
          ),
        ],
      ),
    );
  }

  void _onSubmit() {
    if (_controller.text.isEmpty) {
      return;
    }

    context.read<HomeBloc>().add(HomeSearchEvent(_controller.text));
  }
}

//------------------------------------------------------------------------------
class _WeatherResult extends StatelessWidget {
  const _WeatherResult({
    required this.weather,
  });

  final List<Weather> weather;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 80),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                        border: Border.fromBorderSide(BorderSide(
                      width: 1,
                    ))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Date (mm/dd/yyyy)'),
                        ...weather.map((e) => Text(e.cityName))
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Temperature (F)'),
                        ...weather.map((e) => Text(e.temp))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () => context.read<HomeBloc>().add(HomeBackEvent()),
                child: const Text('Back'),
              )
            ],
          )
        ],
      ),
    );
  }
}

//------------------------------------------------------------------------------
class _FailedResult extends StatelessWidget {
  const _FailedResult();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 80),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Something went wrong'),
          const SizedBox(height: 32),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<HomeBloc>().add(HomeBackEvent()),
          ),
        ],
      ),
    );
  }
}
