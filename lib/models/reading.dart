import 'package:app_sys_eng/models/measurement_unit.dart';
import 'package:app_sys_eng/util/infer.dart';
import 'package:app_sys_eng/util/round.dart';

class Reading {
  final double? _temperature;
  final double? _humidity;
  final double? _wind;
  final DateTime? _timestamp;

  Reading({
    double? temperature,
    double? humidity,
    double? wind,
    DateTime? timestamp,
  })  : _temperature = temperature,
        _humidity = humidity,
        _wind = wind,
        _timestamp = timestamp;

  // HHmmWWWWHHH0TTT
  factory Reading.fromString(String sample, DateTime dateTimeSent) {
    int hour = int.parse(sample.substring(0, 2));
    int minute = int.parse(sample.substring(2, 4));
    DateTime timestamp = inferDate(dateTimeSent, hour, minute);

    double wind = int.parse(sample.substring(4, 8)) / 10.0;
    double humidity = int.parse(sample.substring(8, 11)) / 100.0;
    double temperature = (sample[11] == '1' ? -1 : 1) *
        int.parse(sample.substring(12, 15)) /
        10.0;

    return Reading(
      temperature: temperature,
      humidity: humidity,
      wind: wind,
      timestamp: timestamp,
    );
  }

  factory Reading.fromJson(Map<String, dynamic> json) => Reading(
        humidity: json['humidity'],
        temperature: json['temperature'],
        wind: json['wind'],
        timestamp: json['timestamp'] == null
            ? null
            : DateTime.parse(json['timestamp']),
      );

  Map<String, dynamic> toJson() => {
        'wind': _wind,
        'humidity': _humidity,
        'temperature': _temperature,
        'timestamp': _timestamp?.toIso8601String()
      };

  @override
  String toString() {
    return "Reading at $_timestamp: wind = $_wind; humi = $_humidity; temp = $_temperature";
  }

  DateTime? get timeStamp {
    return _timestamp;
  }

  bool get isFilled =>
      _timestamp != null &&
      _temperature != null &&
      _humidity != null &&
      _wind != null;

  double? temperature(MeasurementUnit unit, {bool round = false}) {
    if (_temperature == null) {
      return null;
    } else {
      double temp;
      switch (unit) {
        case MeasurementUnit.metric:
          temp = _temperature!;
          break;
        case MeasurementUnit.imperial:
          temp = _temperature! * 9.0 / 5.0 + 32;
          break;
      }
      return temp.toPrecision(round ? 1 : 1);
    }
  }

  String temperatureWithUnit(MeasurementUnit unit, {bool round = false}) {
    if (_temperature == null) {
      return "-";
    } else {
      String val =
          temperature(unit, round: round)!.toStringAsFixed(round ? 1 : 1);
      switch (unit) {
        case MeasurementUnit.metric:
          return "$val ºC";
        case MeasurementUnit.imperial:
          return "$val ºF";
      }
    }
  }

  double? wind(MeasurementUnit unit, {bool round = false}) {
    if (_wind == null) {
      return null;
    } else {
      double wind;
      switch (unit) {
        case MeasurementUnit.metric:
          wind = _wind!;
          break;
        case MeasurementUnit.imperial:
          wind = _wind! * 0.6213711922;
          break;
      }
      return wind.toPrecision(round ? 1 : 1);
    }
  }

  String windWithUnit(MeasurementUnit unit, {bool round = false}) {
    if (_wind == null) {
      return "-";
    } else {
      String val = wind(unit, round: round)!.toStringAsFixed(round ? 1 : 1);
      switch (unit) {
        case MeasurementUnit.metric:
          return "$val km/h";
        case MeasurementUnit.imperial:
          return "$val mph";
      }
    }
  }

  double? humidity(MeasurementUnit unit, {bool round = false}) {
    if (_humidity == null) {
      return null;
    } else {
      return _humidity!.toPrecision(2);
    }
  }

  String humidityWithUnit(MeasurementUnit unit, {bool round = false}) {
    if (_humidity == null) {
      return "-";
    } else {
      return "${(100 * humidity(unit, round: round)!).toStringAsFixed(0)}%";
    }
  }
}
