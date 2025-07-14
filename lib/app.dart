import 'package:flutter/material.dart';
import 'package:islamic_app/constants/strings.dart';
import 'package:islamic_app/views/screens/home_screen.dart';
import 'package:islamic_app/views/screens/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      initialRoute: AppStrings.homeRoute,
      theme: ThemeData(fontFamily: "Arabic"),
      routes: {AppStrings.homeRoute: (context) => HomeScreen(), AppStrings.splashRoute: (context) => SplashScreen()},
    );
  }
}
