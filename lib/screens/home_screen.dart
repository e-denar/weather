import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather/blocs/blocs.dart';
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
            onPressed: () => context.read<AuthBloc>().add(AuthLogoutEvent()),
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
            child: Column(
              children: [
                Text('name: ${user.name}'),
                Text('github: ${user.githubUrl}'),
                child,
              ],
            ),
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
          if (weather.isNotEmpty)
            Table(
              border: TableBorder.all(),
              children: [
                const TableRow(
                  children: [
                    Text(
                      'Date (mm/dd/yyyy)',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Temp (F)',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                ...weather.map(
                  (e) => TableRow(
                    decoration: BoxDecoration(
                      color: weather.indexOf(e).isEven
                          ? Colors.grey.withOpacity(0.5)
                          : Colors.transparent,
                    ),
                    children: [
                      Text(DateFormat.yMd().format(e.date)),
                      Text(e.temp)
                    ],
                  ),
                ),
              ],
            )
          else
            const Text('No results.'),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () => context.read<HomeBloc>().add(HomeBackEvent()),
                child: const Text('Back'),
              )
            ],
          ),
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
