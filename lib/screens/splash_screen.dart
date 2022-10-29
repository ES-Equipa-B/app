import 'package:flutter/material.dart';

class SplashScreenState extends StatefulWidget {
  const SplashScreenState({Key? key}) : super(key: key);

  @override
  State<SplashScreenState> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenState> {
  void initializeSplash() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, "/main");
  }

  @override
  void initState() {
    initializeSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Image.asset(
        "images/Logo.png",
        height: 200,
        width: 200,
      )),
    );
  }
}
