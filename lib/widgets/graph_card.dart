import 'package:app_sys_eng/api/get_readings.dart';
import 'package:app_sys_eng/models/graph_reading.dart';
import 'package:app_sys_eng/models/measurement_unit.dart';
import 'package:app_sys_eng/models/station.dart';
import 'package:app_sys_eng/screens/graph_zoom_screen.dart';
import 'package:app_sys_eng/widgets/get_data_graph.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraphCard extends StatefulWidget {
  final Station data;
  const GraphCard({super.key, required this.data});

  @override
  State<GraphCard> createState() => _GraphCard();
}

class _GraphCard extends State<GraphCard> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> combo = const [
      DropdownMenuItem(value: "Last hour", child: Text("Last hour")),
      DropdownMenuItem(value: "Last 6 hours", child: Text("Last 6 hours")),
      DropdownMenuItem(value: "Last 24 hours", child: Text("Last 24 hours")),
      DropdownMenuItem(value: "Last 7 days", child: Text("Last 7 days")),
      DropdownMenuItem(value: "Last month", child: Text("Last month")),
      DropdownMenuItem(value: "Last year", child: Text("Last year"))
    ];
    return combo;
  }

  late Future<GraphReadings> station;
  late Future<List<GraphReadings>> stations;
  late GraphReadings val;
  String selectedValue = "Last hour";
  String apiVal = "";
  double interval = 1;
  double intervalLeft = 5;
  @override
  void initState() {
    super.initState();
    if (selectedValue == 'Last hour') {
      apiVal = 'hour';
    } else if (selectedValue == 'Last 6 hours') {
      apiVal = 'sixhour';
    } else if (selectedValue == 'Last 24 hours') {
      apiVal = 'day';
    } else if (selectedValue == 'Last 7 days') {
      apiVal = 'week';
    } else if (selectedValue == 'Last month') {
      apiVal = 'month';
    } else if (selectedValue == 'Last year') {
      apiVal = 'year';
    }

    station = getReadings(widget.data.id, apiVal);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GraphReadings>(
      future: station,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          GraphReadings val = snapshot.data!;

          var tempChart = showChartTemp(selectedValue, val.valuesGraphTemp());
          var windChart = showChartWind(selectedValue, val.valuesGraphHum());
          var humChart = showChartHum(selectedValue, val.valuesGraphWind());
          return Container(
            height: 420,
            width: 390,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 255, 242, 240)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text("Weather History",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: selectedValue,
                        items: dropdownItems,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                            if (selectedValue == 'Last hour') {
                              apiVal = 'hour';
                            } else if (selectedValue == 'Last 6 hours') {
                              apiVal = 'sixhour';
                            } else if (selectedValue == 'Last 24 hours') {
                              apiVal = 'day';
                            } else if (selectedValue == 'Last 7 days') {
                              apiVal = 'week';
                            } else if (selectedValue == 'Last month') {
                              apiVal = 'month';
                            } else if (selectedValue == 'Last year') {
                              apiVal = 'year';
                            }
                            station = getReadings(widget.data.id, apiVal);
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(
                    top: 10,
                    right: 10,
                  ),
                  width: double.infinity,
                  height: 190,
                  child: LineChart(
                    LineChartData(
                      borderData: FlBorderData(show: false),
                      gridData: FlGridData(show: true),
                      titlesData: FlTitlesData(
                          topTitles: AxisTitles(),
                          rightTitles: AxisTitles(),
                          bottomTitles: AxisTitles(
                              sideTitles: _bottomTitles,
                              axisNameWidget: name(selectedValue)),
                          leftTitles: AxisTitles(sideTitles: _leftTitles)),
                      lineBarsData: [
                        LineChartBarData(
                          spots: tempChart,
                          color: const Color.fromARGB(255, 247, 94, 94),
                        ),
                        LineChartBarData(
                          spots: windChart,
                          color: const Color.fromARGB(255, 122, 222, 126),
                        ),
                        LineChartBarData(
                          spots: humChart,
                          color: const Color.fromARGB(255, 58, 66, 183),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  color: Color.fromARGB(255, 153, 153, 153),
                  height: 10,
                  thickness: 0.5,
                  indent: 8,
                  endIndent: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, right: 10, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              child: const Icon(
                                Icons.fullscreen,
                              ),
                              onTap: () {
                                //Navigator.push(
                                // context,
                                // MaterialPageRoute(
                                // builder: //(context) => //GraphFullScreen(
                                //selectedValue: selectedValue,
                                //data: widget.data,
                                // )));
                              }),
                          const SizedBox(height: 15),
                          const Text(
                            'Average:',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            'Maximum:',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            'Minimum:',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          children: [
                            Row(
                              children: const [
                                Text(
                                  'Temp.',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(Icons.thermostat)
                              ],
                            ),
                            const SizedBox(height: 15),
                            Text(val.avgTempUnit(MeasurementUnit.metric)),
                            const SizedBox(height: 15),
                            Text(val.maxTempUnit(MeasurementUnit.metric)),
                            const SizedBox(height: 15),
                            Text(val.minTempUnit(MeasurementUnit.metric))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          children: [
                            Row(
                              children: const [
                                Text(
                                  'Wind.',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(Icons.air)
                              ],
                            ),
                            const SizedBox(height: 15),
                            Text(val.avgWindUnit(MeasurementUnit.metric)),
                            const SizedBox(height: 15),
                            Text(val.maxWindUnit(MeasurementUnit.metric)),
                            const SizedBox(height: 15),
                            Text(val.minWindUnit(MeasurementUnit.metric))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          children: [
                            Row(
                              children: const [
                                Text(
                                  'Humd.',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(Icons.water_drop_outlined)
                              ],
                            ),
                            const SizedBox(height: 15),
                            Text(val.avgHumUnit(MeasurementUnit.metric)),
                            const SizedBox(height: 15),
                            Text(val.maxHumUnit(MeasurementUnit.metric)),
                            const SizedBox(height: 15),
                            Text(val.minHumUnit(MeasurementUnit.metric))
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const Center(
            child: CircularProgressIndicator(
          color: Colors.blue,
        ));
      },
    );
  }

  Widget name(String selected) {
    if (selected == 'Last hour') {
      return const Text(
        "Last 60 Minutes",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (selected == 'Last 6 hours') {
      return const Text(
        "Last 36 Minutes",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (selected == 'Last 24 hours') {
      return const Text(
        "Last 24 Hours",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (selected == 'Last 7 days') {
      return const Text(
        "Last 7 Days",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (selected == 'Last month') {
      return const Text(
        "Last 30 Month Days",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      return const Text(
        "Last 12 Months",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }

  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        interval: interval,
        getTitlesWidget: (value, meta) {
          String text = '';
          if (selectedValue == "Last hour") {
            interval = 1;
            text = value.toStringAsFixed(0);
          } else if (selectedValue == "Last 6 hours") {
            interval = 4;
            text = value.toStringAsFixed(0);
          } else if (selectedValue == "Last 24 hours") {
            interval = 1;
            text = value.toStringAsFixed(0);
          } else if (selectedValue == "Last 7 days") {
            interval = 1;
            text = value.toStringAsFixed(0);
          } else if (selectedValue == "Last month") {
            interval = 2;
            text = value.toStringAsFixed(0);
          } else if (selectedValue == "Last year") {
            interval = 1;
            text = value.toStringAsFixed(0);
          }
          return Transform.rotate(angle: 0, child: Text(text));
        },
      );
  SideTitles get _leftTitles => SideTitles(
        showTitles: true,
        reservedSize: 40,
        interval: intervalLeft,
        getTitlesWidget: (value, meta) {
          if (selectedValue == "Last hour") {
            intervalLeft = 5;
          } else if (selectedValue == "Last 6 hours") {
            intervalLeft = 4;
          } else if (selectedValue == "Last 24 hours") {
            intervalLeft = 5;
          } else if (selectedValue == "Last 7 days") {
            intervalLeft = 5;
          } else if (selectedValue == "Last month") {
            intervalLeft = 5;
          } else if (selectedValue == "Last year") {
            intervalLeft = 5;
          }
          String text = value.toStringAsFixed(1);

          return Text(text);
        },
      );
}
