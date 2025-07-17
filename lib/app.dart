import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/constants/strings.dart';
import 'package:islamic_app/controllers/home_cubit/home_cubit.dart';
import 'package:islamic_app/controllers/quran_cubit/quran_cubit.dart';
import 'package:islamic_app/views/screens/home_screen.dart';
import 'package:islamic_app/views/screens/splash_screen.dart';
import 'package:islamic_app/views/screens/sura_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => QuranCubit()),
      ],
      child: MaterialApp(
        title: AppStrings.appName,
        initialRoute: AppStrings.homeRoute,
        theme: ThemeData(fontFamily: "Arabic"),
        routes: {AppStrings.homeRoute: (context) => HomeScreen(), AppStrings.suraRoute: (context) => SuraScreen(), AppStrings.splashRoute: (context) => SplashScreen()},
      ),
    );
  }
}
