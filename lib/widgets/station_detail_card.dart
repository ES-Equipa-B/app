import 'package:app_sys_eng/models/station_card_data.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class StationDetailCard extends StatelessWidget {
  final StationCardData data;
  const StationDetailCard({super.key, required this.data});

  String readTimestamp(String timestamp) {
    DateTime now = DateTime.now();
    DateTime date = DateTime.parse(timestamp);
    int diff = now.difference(date).inMinutes;
    if (diff < 1) {
      return 'less then 1 minute ago';
    } else if (diff == 1) {
      return '$diff minute ago';
    } else {
      return '$diff minutes ago';
    }
  }

  @override
  Widget build(BuildContext context) {
    String lastUpdated = readTimestamp(data.timestamp);
    return Container(
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
            padding: const EdgeInsets.only(left: 10.0, bottom: 5),
            child: Text("Updated $lastUpdated",
                style: const TextStyle(
                  color: Color(0xff534341),
                  fontSize: 11,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(Icons.thermostat),
                Icon(Icons.air),
                Icon(Icons.water_drop_outlined)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircularPercentIndicator(
                  radius: 43.0,
                  lineWidth: 5.0,
                  percent: 1.0,
                  center: Text("${data.temperature} ºC"),
                  progressColor: const Color.fromARGB(255, 247, 94, 94),
                ),
                CircularPercentIndicator(
                  radius: 43.0,
                  lineWidth: 5.0,
                  percent: 1.0,
                  center: Text("${data.wind} m/s"),
                  progressColor: const Color.fromARGB(255, 122, 222, 126),
                ),
                CircularPercentIndicator(
                  radius: 43.0,
                  lineWidth: 5.0,
                  percent: 1.0,
                  center: Text("${100 * data.humidity}%"),
                  progressColor: const Color.fromARGB(255, 58, 66, 183),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
