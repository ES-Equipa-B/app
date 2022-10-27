import 'dart:async';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:app_sys_eng/widgets/station_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

////////////////////////////////////
//VER O REFRESH E OS VALORES P DATA/
///////////////////////////////////
class _DataPageState extends State<DataPage> {
  //MUDAR ISSOOOOOOOOOOOO, UMA MERDA
  final StationCardData data = StationCardData(
      id: 1,
      name: "Porto",
      temperature: 37,
      wind: 21,
      humidity: 58.7,
      phone: '123456789',
      timestamp: "a");

  var time = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            Dummy().name,
            style: const TextStyle(
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
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text("Settings",
                      style: TextStyle(color: Color(0xff534341))),
                ),
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text("WipeData",
                      style: TextStyle(color: Color(0xff534341))),
                ),
                const PopupMenuItem<int>(
                  value: 2,
                  child: Text("Delete",
                      style: TextStyle(color: Color(0xff534341))),
                ),
              ],
              onSelected: (item) => selecteditem(context, item),
            )
          ],
        ),
        body: RefreshIndicator(
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            onRefresh: () => Future.sync(() => setState(() => {time = 2})),
            child: Stack(children: [
              ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      height: 240,
                      width: 390,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromARGB(255, 255, 242, 240)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text("Current Weather Information",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text("Updated $time s ago",
                                  style: const TextStyle(
                                    color: Color(0xff534341),
                                    fontSize: 11,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15.0, right: 8, left: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("Temperature",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                  Text("Wind Speed",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                  Text("Humidity",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5.0, right: 8, left: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Icon(Icons.thermostat),
                                  Icon(Icons.air),
                                  Icon(Icons.water_drop_outlined)
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircularPercentIndicator(
                                    radius: 43.0,
                                    lineWidth: 5.0,
                                    percent: 1.0,
                                    center: Text(
                                        "${data.temperature.toStringAsFixed(0)} ºC"),
                                    progressColor:
                                        const Color.fromARGB(255, 247, 94, 94),
                                  ),
                                  CircularPercentIndicator(
                                    radius: 43.0,
                                    lineWidth: 5.0,
                                    percent: 1.0,
                                    center: Text(
                                        "${StationCard(data: data).data.wind.toStringAsFixed(0)} m/s"),
                                    progressColor: const Color.fromARGB(
                                        255, 122, 222, 126),
                                  ),
                                  CircularPercentIndicator(
                                    radius: 43.0,
                                    lineWidth: 5.0,
                                    percent: 1.0,
                                    center: Text(
                                        "${StationCard(data: data).data.humidity.toStringAsFixed(0)}%"),
                                    progressColor:
                                        const Color.fromARGB(255, 58, 66, 183),
                                  ),
                                ],
                              ),
                            )
                          ]),
                    ),
                  )
                ],
              ),
            ])));
  }

  selecteditem(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.pushNamed(context, "/edit");
        break;
      case 1:
        //Metodo para apagar os dados da estaçao
        break;
      case 2:
        //Metodo para apagar a estação
        break;
      default:
    }
  }
}
