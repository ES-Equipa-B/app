import 'package:app_sys_eng/screens/data/data_page.dart';
import 'package:flutter/material.dart';

//FAZER UMA CLASSE PARA GUARDAR AS INFORMAÇÔES DA»O CARD SELECIONADO

class StationCard extends StatelessWidget {
  final StationCardData data;
  late final Function loadData;
  void _loadData() {
    loadData(data.name);
    loadData(data.temperature);
    loadData(data.humidity);
    loadData(data.wind);
    loadData(data.timestamp);
  }

  StationCard({super.key, required this.data});

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ValueIndicator(
                        icon: Icons.thermostat,
                        value: "${data.temperature.toStringAsFixed(0)} ºC"),
                    ValueIndicator(
                        icon: Icons.air,
                        value: "${data.wind.toStringAsFixed(0)} m/s"),
                    ValueIndicator(
                        icon: Icons.water_drop_outlined,
                        value: "${data.humidity.toStringAsFixed(1)}%")
                  ],
                )
              ]),
          onTap: () {
<<<<<<< HEAD
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DataScreen(
                    id: data.id,
                  ),
                ));
=======
            // MANDAR PARA OUTRA PÁGINA

            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DataPage(
                    name: data.name,
                    temp: data.temperature.toString(),
                    wind: data.wind.toString(),
                    hum: data.humidity.toString(),
                    timestamp: data.timestamp,
                  ),
                ));
            _loadData();
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
