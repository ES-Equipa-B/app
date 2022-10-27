import 'package:app_sys_eng/screens/new_station/container/insert_station.dart';
import 'package:flutter/material.dart';

class NewStationPage extends StatelessWidget {
  const NewStationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "New Station",
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
              Navigator.pushNamed(context, "/main");
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
