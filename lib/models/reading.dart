import 'package:app_sys_eng/util/infer.dart';

class Reading {
  final double? temperature;
  final double? humidity;
  final double? wind;
  final DateTime timestamp;

  Reading({
    required this.temperature,
    required this.humidity,
    required this.wind,
    required this.timestamp,
  });

  // HHmmWWWWHHH0TTT
  factory Reading.fromString(String sample, DateTime dateTimeSent) {
    int hour = int.parse(sample.substring(0, 2));
    int minute = int.parse(sample.substring(2, 4));
    DateTime timestamp = inferDate(dateTimeSent, hour, minute);

    double wind = int.parse(sample.substring(4, 8)) * 0.1;
    double humidity = 0;
    double temperature = 0;

    return Reading(
        temperature: temperature,
        humidity: humidity,
        wind: wind,
        timestamp: timestamp);
  }
}
