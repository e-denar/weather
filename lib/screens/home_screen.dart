import 'package:flutter/material.dart';

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
    return const Scaffold(
      body: Center(child: Text('HomeScreen')),
    );
  }
}
