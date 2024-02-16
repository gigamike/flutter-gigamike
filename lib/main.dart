import 'package:flutter/material.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:gigamike/screens/home.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const MaterialApp(
    title: 'Test Widgets',
    home: Home(),
  ));
}