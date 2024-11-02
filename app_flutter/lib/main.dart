import 'dart:io';

import 'package:app_flutter/backend/config/environment.settings.dart';
import 'package:app_flutter/backend/injectable/injection.dart';
import 'package:app_flutter/screens/home.dart';
import 'package:app_flutter/screens/login.dart';
import 'package:flutter/material.dart';

class MyHttpOverrides extends HttpOverrides {
  //development only
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  configureInjection(EnvironmentSettings.getEnvironment);

  runApp(const MaterialApp(
      home: Scaffold(
    body: Home(),
  )));
}
