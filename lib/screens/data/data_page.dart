import 'dart:async';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:app_sys_eng/widgets/station_card.dart';
import 'package:flutter/material.dart';

class DataPage extends StatefulWidget {
  final String name, temp, hum, wind, timestamp;
  const DataPage(
      {Key? key,
      required this.name,
      required this.temp,
      required this.hum,
      required this.wind,
      required this.timestamp})
      : super(key: key);

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  late final StationCardData d;

  String readTimestamp() {
    DateTime now = DateTime.now();
    DateTime date = DateTime.parse(widget.timestamp);
    int diff = now.difference(date).inMinutes;
    if (diff < 1) {
      return 'less then 1 minute ago';
    } else if (diff == 1) {
      return '$diff minute ago';
    } else {
      return '$diff minutes ago';
    }
  }

  var time = 0;

  @override
  Widget build(BuildContext context) {
    String lastUpdated = readTimestamp();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            widget.name,
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
              Navigator.pop(context);
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
                              padding:
                                  const EdgeInsets.only(left: 10.0, bottom: 5),
                              child: Text("Updated $lastUpdated",
                                  style: const TextStyle(
                                    color: Color(0xff534341),
                                    fontSize: 11,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Icon(Icons.thermostat),
                                  Icon(Icons.air),
                                  Icon(Icons.water_drop_outlined)
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 0.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CircularPercentIndicator(
                                    radius: 43.0,
                                    lineWidth: 5.0,
                                    percent: 1.0,
                                    center: Text("${widget.temp} ºC"),
                                    progressColor:
                                        const Color.fromARGB(255, 247, 94, 94),
                                  ),
                                  CircularPercentIndicator(
                                    radius: 43.0,
                                    lineWidth: 5.0,
                                    percent: 1.0,
                                    center: Text("${widget.wind} m/s"),
                                    progressColor: const Color.fromARGB(
                                        255, 122, 222, 126),
                                  ),
                                  CircularPercentIndicator(
                                    radius: 43.0,
                                    lineWidth: 5.0,
                                    percent: 1.0,
                                    center: Text("${widget.hum}%"),
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
