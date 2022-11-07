import 'package:app_sys_eng/widgets/settings_options.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool val1 = false;
  int unit = 1;
  String unitName = '';

  @override
  void initState() {
    loadVal();
    super.initState();
  }

  void loadVal() async {
    final pref = await SharedPreferences.getInstance();
    final prefUnit = await SharedPreferences.getInstance();
    setState(() {
      val1 = pref.getBool('val') ?? false;
      unit = prefUnit.getInt('unit') ?? 1;
    });
  }

  void _setState(bool newValue) {
    setState(() {
      val1 = newValue;
      saveValue();
    });
  }

  void _setStateUnit(int newValue) {
    setState(() {
      unit = newValue;
      saveValueUnit();
    });
  }

  void saveValue() async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool('val', val1);
  }

  void saveValueUnit() async {
    final pref = await SharedPreferences.getInstance();
    pref.setInt('unit', unit);
  }

  @override
  Widget build(BuildContext context) {
    if (unit == 1) {
      unitName = 'Metric';
    } else {
      unitName = 'Imperial';
    }
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "Settings",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Container(
              height: 650,
              width: 390,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SettingsOptions().customSwitch('Main Station',
                      'Make this device a main station', val1, _setState),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 16, top: 15, right: 30),
                      child: const SettingsOptions()
                          .dropDown("Measurement Unit", unit, _setStateUnit)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      unitName,
                      style: const TextStyle(
                          color: Color(0xff534341), fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
