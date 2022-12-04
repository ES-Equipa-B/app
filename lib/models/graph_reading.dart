import 'package:app_sys_eng/models/measurement_unit.dart';

class GraphReadings {
  final Map<String, dynamic>? max;
  final Map<String, dynamic>? min;
  final Map<String, dynamic>? avg;
  final List<dynamic>? readings;

  GraphReadings(
      {required this.max,
      required this.min,
      required this.avg,
      required this.readings});

  List<dynamic> valuesGraphTemp() {
    List<dynamic> valGraph = [];

    for (var element in readings!) {
      if (element['temperature'] == null) {
        valGraph.add(null);
      } else {
        valGraph.add(element['temperature']);
      }
    }
    return valGraph;
  }

  List<dynamic> valuesGraphHum() {
    List<dynamic> valGraph = [];
    for (var element in readings!) {
      if (element['humidity'] == null) {
        valGraph.add(null);
      } else {
        valGraph.add(element['humidity']);
      }
    }
    return valGraph;
  }

  List<dynamic> valuesGraphWind() {
    List<dynamic> valGraph = [];
    for (var element in readings!) {
      if (element['wind'] == null) {
        valGraph.add(null);
      } else {
        valGraph.add(element['wind']);
      }
    }
    return valGraph;
  }

  String avgTempUnit(MeasurementUnit unit) {
    if (avg!["temperature"] == null) {
      return "-";
    } else {
      return "${avg!["temperature"].toStringAsFixed(1)} ºC";
    }
  }

  String maxTempUnit(MeasurementUnit unit) {
    if (max!["temperature"] == null) {
      return "-";
    } else {
      return "${max!["temperature"].toStringAsFixed(1)} ºC";
    }
  }

  String minTempUnit(MeasurementUnit unit) {
    if (min!["temperature"] == null) {
      return "-";
    } else {
      return "${min!["temperature"].toStringAsFixed(1)} ºC";
    }
  }

  String avgWindUnit(MeasurementUnit unit) {
    if (avg!["wind"] == null) {
      return "-";
    } else {
      return "${avg!["wind"].toStringAsFixed(1)} m/s";
    }
  }

  String maxWindUnit(MeasurementUnit unit) {
    if (max!["wind"] == null) {
      return "-";
    } else {
      return "${max!["wind"].toStringAsFixed(1)} m/s";
    }
  }

  String minWindUnit(MeasurementUnit unit) {
    if (min!["wind"] == null) {
      return "-";
    } else {
      return "${min!["wind"].toStringAsFixed(1)} m/s";
    }
  }

  String avgHumUnit(MeasurementUnit unit) {
    if (avg!["humidity"] == null) {
      return "-";
    } else {
      return "${(100 * avg!["humidity"]).toStringAsFixed(1)}%";
    }
  }

  String maxHumUnit(MeasurementUnit unit) {
    if (max!["humidity"] == null) {
      return "-";
    } else {
      return "${(100 * max!["humidity"]).toStringAsFixed(1)}%";
    }
  }

  String minHumUnit(MeasurementUnit unit) {
    if (min!["humidity"] == null) {
      return "-";
    } else {
      return "${(100 * min!["humidity"]).toStringAsFixed(1)}%";
    }
  }

  factory GraphReadings.fromJson(Map<String, dynamic> json) {
    return GraphReadings(
        max: json['max'],
        min: json['min'],
        avg: json['avg'],
        readings: json['readings']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['max'] = max;
    data['min'] = min;
    data['avg'] = avg;
    data['readings'] = readings;

    return data;
  }
}
