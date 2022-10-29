import 'package:app_sys_eng/screens/edit_station_screen.dart';
import 'package:app_sys_eng/screens/main_screen.dart';
import 'package:app_sys_eng/screens/settings_screen.dart';
import 'package:app_sys_eng/screens/splash_screen.dart';
import 'package:app_sys_eng/screens/new_station_screen.dart';

import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => const SplashScreenState(),
        "/main": (context) => const MainScreen(),
        "/newstation": (context) => const NewStationScreen(),
        "/settings": (context) => const SettingsScreen(),
        "/edit": (context) => const EditStationScreen()
      },
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red),
      ),
    );
  }
}
