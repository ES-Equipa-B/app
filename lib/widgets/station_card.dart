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
            print("Clicaste no container"); // MANDAR PARA OUTRA PÁGINA
          }, // Handle your callback
        ));
  }
}

class StationCardData {
  final String name;
  final double temperature;
  final double wind;
  final double humidity;

  const StationCardData(
      {required this.name,
      required this.temperature,
      required this.wind,
      required this.humidity});

  factory StationCardData.fromJson(Map<String, dynamic> json) {
    return StationCardData(
        name: json["name"],
        temperature: json["temperature"].toDouble(),
        wind: json["wind"].toDouble(),
        humidity: json["humidity"].toDouble());
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
