import 'package:app_sys_eng/home/home_page.dart';
import 'package:app_sys_eng/splash/splash_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => const SplashPage(),
        "/home": (context) => const HomePage(),
        //FAZER AQUI A ROTA PARA A MAIN PAGE DO PEDRO
      },
      theme: ThemeData(useMaterial3: true),
    );
  }
}
