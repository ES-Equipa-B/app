import 'package:app_sys_eng/screens/new_station/container/insert_station.dart';
import 'package:flutter/material.dart';

class EditStationPage extends StatelessWidget {
  const EditStationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "Edit Station",
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
              //change this, put here the screen of data
              // Navigator.pushReplacementNamed(context, "/main");
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(children: const [ContainerNewStation()]),
          ),
        ));
  }
}
