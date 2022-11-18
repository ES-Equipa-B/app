import 'package:app_sys_eng/models/station_card_data.dart';
import 'package:flutter/material.dart';

class Combo {
  List<String> combo = [
    "Last hour",
    "Last 6 hours",
    "Last 24 hours",
    "Last 7 days",
    "Last monnth",
    "Last year"
  ];
}

class GraphCard extends StatelessWidget {
  final StationCardData data;
  const GraphCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: 390,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color.fromARGB(255, 255, 242, 240)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Weather History",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        )
      ]),
    );
  }
}
