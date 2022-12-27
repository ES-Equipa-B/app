import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class WeatherStat extends StatelessWidget {
  final String title;
  final String measurement;
  final IconData icon;
  final Color color;

  const WeatherStat(
      {super.key,
      required this.title,
      required this.measurement,
      required this.icon,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon),
        Padding(
          padding: const EdgeInsets.only(top: 3, bottom: 12),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CircularPercentIndicator(
          radius: 43.0,
          lineWidth: 5.0,
          percent: 1.0,
          center: Text(
            measurement,
            style: TextStyle(
                color: color, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          progressColor: color,
        ),
      ],
    );
  }
}
