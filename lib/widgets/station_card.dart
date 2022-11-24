import 'package:app_sys_eng/screens/data_screen.dart';
import 'package:flutter/material.dart';

import '../models/station_card_data.dart';

class StationCard extends StatelessWidget {
  final StationCardData data;
  final Function refresh;

  const StationCard({super.key, required this.data, required this.refresh});

  String get temperature {
    if (data.temperature == null) {
      return "-";
    } else {
      return "${data.temperature!.toStringAsFixed(0)} ºC";
    }
  }

  String get wind {
    if (data.wind == null) {
      return "-";
    } else {
      return "${data.wind!.toStringAsFixed(0)} m/s";
    }
  }

  String get humidity {
    if (data.humidity == null) {
      return "-";
    } else {
      return "${(100 * data.humidity!).toStringAsFixed(0)}%";
    }
  }

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
                      value: temperature,
                    ),
                    ValueIndicator(
                      icon: Icons.air,
                      value: wind,
                    ),
                    ValueIndicator(
                        icon: Icons.water_drop_outlined, value: humidity),
                  ],
                )
              ]),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DataScreen(
                    id: data.id,
                  ),
                ));
            refresh(data);
          }, // Handle your callback
        ));
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
