import 'package:app_sys_eng/models/station_card_data.dart';
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
                  LineChartBarData(spots: showChart(selectedValue)),
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
                      const Text('data'),
                      const SizedBox(height: 15),
                      const Text('data'),
                      const SizedBox(height: 15),
                      const Text('data')
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
                      const Text('data'),
                      const SizedBox(height: 15),
                      const Text('data'),
                      const SizedBox(height: 15),
                      const Text('data')
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
                      const Text('data'),
                      const SizedBox(height: 15),
                      const Text('data'),
                      const SizedBox(height: 15),
                      const Text('data')
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

//dummy data
showChart(String selectedValue) {
  if (selectedValue == "Last hour") {
    return <FlSpot>[
      const FlSpot(0, 1),
      const FlSpot(1, 3),
      const FlSpot(2, 10),
      const FlSpot(3, 7),
      const FlSpot(4, 12),
      const FlSpot(5, 13),
      const FlSpot(6, 17),
      const FlSpot(7, 15),
      const FlSpot(8, 20)
    ];
  } else if (selectedValue == 'Last 6 hours') {
    return <FlSpot>[
      const FlSpot(0, 12),
      const FlSpot(1, 11),
      const FlSpot(2, 10),
      const FlSpot(3, 7),
      const FlSpot(4, 6),
      const FlSpot(5, 3),
      const FlSpot(6, 11),
      const FlSpot(7, 15),
      const FlSpot(8, 8)
    ];
  } else if (selectedValue == 'Last 24 hours') {
    return <FlSpot>[
      const FlSpot(0, 11),
      const FlSpot(1, 11),
      const FlSpot(2, 11),
      const FlSpot(3, 17),
      const FlSpot(4, 18),
      const FlSpot(5, 11),
      const FlSpot(6, 10),
      const FlSpot(7, 15),
      const FlSpot(8, 8)
    ];
  } else if (selectedValue == 'Last 7 days') {
    return <FlSpot>[
      const FlSpot(0, 12),
      const FlSpot(1, 11),
      const FlSpot(2, 11),
      const FlSpot(3, 11),
      const FlSpot(4, 16),
      const FlSpot(5, 17),
      const FlSpot(6, 17),
      const FlSpot(7, 15),
      const FlSpot(8, 8)
    ];
  } else if (selectedValue == 'Last month') {
    return <FlSpot>[
      const FlSpot(0, 12),
      const FlSpot(1, 11),
      const FlSpot(2, 10),
      const FlSpot(3, 7),
      const FlSpot(4, 6),
      const FlSpot(5, 3),
      const FlSpot(6, 11),
      const FlSpot(7, 15),
      const FlSpot(8, 8)
    ];
  } else {
    return <FlSpot>[
      const FlSpot(0, 14),
      const FlSpot(1, 1),
      const FlSpot(2, 10),
      const FlSpot(3, 15),
      const FlSpot(4, 16),
      const FlSpot(5, 17),
      const FlSpot(6, 10),
      const FlSpot(7, 11),
      const FlSpot(8, 8)
    ];
  }
}
