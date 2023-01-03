import 'package:app_sys_eng/blocs/settings_bloc.dart';
import 'package:app_sys_eng/blocs/station_list_bloc.dart';
import 'package:app_sys_eng/screens/main_screen.dart';
import 'package:app_sys_eng/screens/settings_screen.dart';
import 'package:app_sys_eng/screens/splash_screen.dart';
import 'package:app_sys_eng/screens/new_station_screen.dart';
import 'package:app_sys_eng/sms_service.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
    stationListBloc.fetchAllStations();
    settingsBloc.loadFromPreferences();

    settingsBloc.settings.listen((settings) {
      if (settings.mainStation) {
        SMSService.enable();
      } else {
        SMSService.disable();
      }
    });
  }

  @override
  void dispose() {
    stationListBloc.dispose();
    super.dispose();
  }

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
      },
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red),
      ),
    );
  }
}
