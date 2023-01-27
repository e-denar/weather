import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  static const path = '/landing';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Landing screen')),
    );
  }
}