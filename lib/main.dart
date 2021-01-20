import 'package:flutter/material.dart';

import 'app.dart';
import 'di/injector_provider.dart';

void main() async {
  setupInjection();
  runApp(App());
}