import 'package:flutter/material.dart';
import 'package:weather/env.dart';

import 'app.dart';

void main() {
  // TODO: create other flavors and modify launch.json
  EnvConfig(env: Env.debug);
  runApp(const App());
}
