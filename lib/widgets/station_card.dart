import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Dummy {
  String name = 'Porto';
  int hum = 0;
  int temp = 0;
  int wind = 0;
}

class StationCard extends StatelessWidget {
  final StationCardData data;

  const StationCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 242, 240),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1),
            ]),
        padding: const EdgeInsets.all(8),
        child: InkWell(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.name, textAlign: TextAlign.left),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ValueIndicator(
                        icon: Icons.thermostat,
                        value: "${data.temperature.toStringAsFixed(0)} ºC"),
                    ValueIndicator(
                        icon: Icons.air,
                        value: "${data.wind.toStringAsFixed(0)} m/s"),
                    ValueIndicator(
                        icon: Icons.water_drop_outlined,
                        value: "${(100 * data.humidity).toStringAsFixed(0)}%")
                  ],
                )
              ]),
          onTap: () {
            // MANDAR PARA OUTRA PÁGINA
            Navigator.pushNamed(context, "/data");
          }, // Handle your callback
        ));
  }
}

class StationCardData {
  final double humidity;
  final int id;
  final String name;
  final String phone;
  final int temperature;
  final String timestamp;
  final int wind;

  StationCardData(
      {required this.humidity,
      required this.id,
      required this.name,
      required this.phone,
      required this.temperature,
      required this.timestamp,
      required this.wind});

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

class ValueIndicator extends StatelessWidget {
  final IconData icon;
  final String value;

  const ValueIndicator({super.key, required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(children: [Icon(icon), Text(value)]);
  }
}
