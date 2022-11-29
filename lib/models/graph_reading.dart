import 'package:app_sys_eng/models/measurement_unit.dart';

class GraphReadings {
  final double? wind;
  final double? hum;
  final double? temp;
  final String? timestamp;
  final Map<String, dynamic>? max;
  final Map<String, dynamic>? min;
  final Map<String, dynamic>? avg;

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

  String avgTempUnit(MeasurementUnit unit) {
    if (avg?[2] == null) {
      return "-";
    } else {
      return "${avg![2].toStringAsFixed(0)} ºC";
    }
  }

  String maxTempUnit(MeasurementUnit unit) {
    if (max?[2] == null) {
      return "-";
    } else {
      return "${max![2].toStringAsFixed(0)} ºC";
    }
  }

  String minTempUnit(MeasurementUnit unit) {
    if (min?[2] == null) {
      return "-";
    } else {
      return "${min![2].toStringAsFixed(0)} ºC";
    }
  }

  String avgWindUnit(MeasurementUnit unit) {
    if (avg?[0] == null) {
      return "-";
    } else {
      return "${avg![0].toStringAsFixed(0)} m/s";
    }
  }

  String maxWindUnit(MeasurementUnit unit) {
    if (max?[0] == null) {
      return "-";
    } else {
      return "${max![0].toStringAsFixed(0)} m/s";
    }
  }

  String minWindUnit(MeasurementUnit unit) {
    if (min?[0] == null) {
      return "-";
    } else {
      return "${min![0].toStringAsFixed(0)} m/s";
    }
  }

  String avgHumUnit(MeasurementUnit unit) {
    if (avg?[1] == null) {
      return "-";
    } else {
      return "${(100 * avg![1]).toStringAsFixed(0)}%";
    }
  }

  String maxHumUnit(MeasurementUnit unit) {
    if (max?[1] == null) {
      return "-";
    } else {
      return "${(100 * max![1]).toStringAsFixed(0)}%";
    }
  }

  String minHumUnit(MeasurementUnit unit) {
    if (min?[1] == null) {
      return "-";
    } else {
      return "${(100 * min![1]).toStringAsFixed(0)}%";
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
