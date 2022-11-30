import 'package:app_sys_eng/models/measurement_unit.dart';

class GraphReadings {
  final double? wind;
  final double? hum;
  final double? temp;
  final String? timestamp;
  final Map<String, dynamic>? max;
  final Map<String, dynamic>? min;
  final Map<String, dynamic>? avg;
  Map<String, dynamic>? a;

  GraphReadings({
    required this.max,
    required this.min,
    required this.avg,
    required this.timestamp,
    required this.temp,
    required this.wind,
    required this.hum,
  });

  double tempGraph() {
    if (temp == null) {
      return 0;
    } else {
      return temp!;
    }
  }

  String avgTempUnit(MeasurementUnit unit, GraphReadings val) {
    if (val.avg!["temperature"] == null) {
      return "-";
    } else {
      return "${val.avg!["temperature"].toStringAsFixed(1)} ºC";
    }
  }

  String maxTempUnit(MeasurementUnit unit, GraphReadings val) {
    if (val.max!["temperature"] == null) {
      return "-";
    } else {
      return "${val.max!["temperature"].toStringAsFixed(1)} ºC";
    }
  }

  String minTempUnit(MeasurementUnit unit, GraphReadings val) {
    if (val.min!["temperature"] == null) {
      return "-";
    } else {
      return "${val.min!["temperature"].toStringAsFixed(1)} ºC";
    }
  }

  String avgWindUnit(MeasurementUnit unit, GraphReadings val) {
    if (val.avg!["wind"] == null) {
      return "-";
    } else {
      return "${val.avg!["wind"].toStringAsFixed(1)} m/s";
    }
  }

  String maxWindUnit(MeasurementUnit unit, GraphReadings val) {
    if (val.max!["wind"] == null) {
      return "-";
    } else {
      return "${val.max!["wind"].toStringAsFixed(1)} m/s";
    }
  }

  String minWindUnit(MeasurementUnit unit, GraphReadings val) {
    if (val.min!["wind"] == null) {
      return "-";
    } else {
      return "${val.min!["wind"].toStringAsFixed(1)} m/s";
    }
  }

  String avgHumUnit(MeasurementUnit unit, GraphReadings val) {
    if (val.avg!["humidity"] == null) {
      return "-";
    } else {
      return "${(100 * val.avg!["humidity"]).toStringAsFixed(1)}%";
    }
  }

  String maxHumUnit(MeasurementUnit unit, GraphReadings val) {
    if (val.max!["humidity"] == null) {
      return "-";
    } else {
      return "${(100 * val.max!["humidity"]).toStringAsFixed(1)}%";
    }
  }

  String minHumUnit(MeasurementUnit unit, GraphReadings val) {
    if (val.min!["humidity"] == null) {
      return "-";
    } else {
      return "${(100 * val.min!["humidity"]).toStringAsFixed(1)}%";
    }
  }

  factory GraphReadings.fromJson(Map<String, dynamic> json) {
    return GraphReadings(
        max: json['max'],
        min: json['min'],
        avg: json['avg'],
        timestamp: json['timestamp'],
        temp: json['temp'],
        wind: json['wind'],
        hum: json['hum']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['max'] = max;
    data['min'] = min;
    data['avg'] = avg;
    data['timestamp'] = timestamp;
    data['temp'] = temp;
    data['wind'] = wind;
    data['hum'] = hum;

    return data;
  }
}
