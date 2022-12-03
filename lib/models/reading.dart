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

    double wind = int.parse(sample.substring(4, 8)) / 10;
    double humidity = double.parse(sample.substring(8, 11)) / 100;
    double temperature =
        (sample[11] == '1' ? -1 : 1) * int.parse(sample.substring(12, 15)) / 10;

    return Reading(
        temperature: temperature,
        humidity: humidity,
        wind: wind,
        timestamp: timestamp);
  }

  Map<String, dynamic> toJson() => {
        'wind': wind,
        'humidity': humidity,
        'temperature': temperature,
        'timestamp': timestamp.toIso8601String()
      };

  @override
  String toString() {
    return "Reading at $timestamp: wind = $wind; humi = $humidity; temp = $temperature";
  }
}
