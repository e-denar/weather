import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  static const path = '/weather';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('WeatherScreen')),
    );
  }
}
