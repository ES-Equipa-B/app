import 'package:app_sys_eng/models/reading.dart';

class Station {
  final int id;
  final String name;
  final String phone;

  final Reading reading;

  Station({
    required this.id,
    required this.name,
    required this.phone,
    required this.reading,
  });

  factory Station.fromJson(Map<String, dynamic> json) {
    return Station(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      reading: Reading(
        humidity: json['humidity'],
        temperature: json['temperature'],
        timestamp: DateTime.parse(json['timestamp']),
        wind: json['wind'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['humidity'] = reading.humidity;
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['temperature'] = reading.temperature;
    data['timestamp'] = reading.timeStamp;
    data['wind'] = reading.wind;
    return data;
  }
}
