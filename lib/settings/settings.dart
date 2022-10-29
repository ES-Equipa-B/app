import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool val1 = true;
  onChangedFunction1(bool newValue1) {
    setState(() {
      val1 = newValue1;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              //TROCAR SPLASH PELO ROUTE DO MAIN DO PEDRO
              //Navigator.pushReplacementNamed(context, "/splash");
              Navigator.pushReplacementNamed(context, "/home");
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
                  customSwitch(
                      'Main Station',
                      'Make this device a main station',
                      val1,
                      onChangedFunction1),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16, top: 15),
                    child: Text(
                      "Measurement Unit",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

Widget customSwitch(
    String text, String def, bool val, Function onChangedMethod) {
  return Padding(
    padding: const EdgeInsets.only(left: 16, right: 16),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          Text(
            def,
            style: const TextStyle(color: Color(0xff534341), fontSize: 12),
          ),
        ],
      ),
      const Spacer(),
      Switch(
          activeColor: const Color.fromARGB(255, 255, 192, 192),
          value: val,
          onChanged: (newValue) {
            onChangedMethod(newValue);
          }),
    ]),
  );
}