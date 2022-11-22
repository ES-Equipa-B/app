import 'package:app_sys_eng/models/station_card_data.dart';
import 'package:app_sys_eng/widgets/get_data_graph.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraphCard extends StatefulWidget {
  final StationCardData data;
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

  String selectedValue = "Last hour";

  @override
  Widget build(BuildContext context) {
    var tempChart = showChartTemp(selectedValue);
    var windChart = showChartWind(selectedValue);
    var humChart = showChartHum(selectedValue);
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
                    });
                  },
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, right: 10),
            width: 310,
            height: 190,
            child: LineChart(
              LineChartData(
                borderData: FlBorderData(show: false),
                gridData: FlGridData(show: true),
                titlesData: FlTitlesData(
                    topTitles: AxisTitles(), rightTitles: AxisTitles()),
                lineBarsData: [
                  LineChartBarData(
                      spots: tempChart[0],
                      color: const Color.fromARGB(255, 247, 94, 94)),
                  LineChartBarData(
                      spots: windChart[0],
                      color: const Color.fromARGB(255, 122, 222, 126)),
                  LineChartBarData(
                      spots: humChart[0],
                      color: const Color.fromARGB(255, 58, 66, 183)),
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
                  children: const [
                    Text(' '),
                    SizedBox(height: 15),
                    Text(
                      'Average:',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Maximum:',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
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
                      Text(tempChart[1]),
                      const SizedBox(height: 15),
                      Text(tempChart[2]),
                      const SizedBox(height: 15),
                      Text(tempChart[3])
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
                      Text(windChart[1]),
                      const SizedBox(height: 15),
                      Text(windChart[2]),
                      const SizedBox(height: 15),
                      Text(windChart[3])
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
                      Text(humChart[1]),
                      const SizedBox(height: 15),
                      Text(humChart[2]),
                      const SizedBox(height: 15),
                      Text(humChart[3])
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
