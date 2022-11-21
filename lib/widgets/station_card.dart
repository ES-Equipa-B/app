import 'package:app_sys_eng/screens/data_screen.dart';
import 'package:flutter/material.dart';

import '../models/station_card_data.dart';

class StationCard extends StatelessWidget {
  final StationCardData data;
  final Function requestRefresh;

  const StationCard(
      {super.key, required this.data, required this.requestRefresh});

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
          onTap: () async {
            await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DataScreen(
                    id: data.id,
                  ),
                ));
            requestRefresh();
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
