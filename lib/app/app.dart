import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/resources/routes_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {


  MyApp._internal(); // private constructor

  static final MyApp instance = MyApp._internal(); // singleton

  factory MyApp() => instance; // factory for class instance

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: RoutesManager.splash,
      theme: getApplicationTheme(),
    );
  }
}
