import 'package:app_sys_eng/models/measurement_unit.dart';

class StationCardData {
  final int id;
  final String name;
  final String phone;
  final double? temperature;
  final double? humidity;
  final double? wind;
  final String timestamp;

  StationCardData(
      {required this.humidity,
      required this.id,
      required this.name,
      required this.phone,
      required this.temperature,
      required this.timestamp,
      required this.wind});

  String temperatureWithUnit(MeasurementUnit unit) {
    if (temperature == null) {
      return "-";
    } else {
      return "${temperature!.toStringAsFixed(0)} ºC";
    }
  }

  String windWithUnit(MeasurementUnit unit) {
    if (wind == null) {
      return "-";
    } else {
      return "${wind!.toStringAsFixed(0)} m/s";
    }
  }

  String humidityWithUnit(MeasurementUnit unit) {
    if (humidity == null) {
      return "-";
    } else {
      return "${(100 * humidity!).toStringAsFixed(0)}%";
    }
  }

  factory StationCardData.fromJson(Map<String, dynamic> json) {
    return StationCardData(
        humidity: json['humidity'],
        id: json['id'],
        name: json['name'],
        phone: json['phone'],
        temperature: json['temperature'],
        timestamp: json['timestamp'],
        wind: json['wind']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['humidity'] = humidity;
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['temperature'] = temperature;
    data['timestamp'] = timestamp;
    data['wind'] = wind;
    return data;
  }
}
