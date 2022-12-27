import 'package:app_sys_eng/colors.dart';
import 'package:app_sys_eng/models/measurement_unit.dart';
import 'package:app_sys_eng/models/station.dart';
import 'package:app_sys_eng/widgets/weather_stat.dart';
import 'package:flutter/material.dart';

import 'package:timeago/timeago.dart' as timeago;

class StationDetailCard extends StatelessWidget {
  final Station station;
  final MeasurementUnit unit;

  const StationDetailCard(
      {super.key, required this.station, required this.unit});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBG,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: Text("Current Weather Information",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 5),
            child: Text(
                station.reading.timeStamp != null
                    ? "Updated ${timeago.format(station.reading.timeStamp!)}"
                    : "No data available",
                style: const TextStyle(
                  color: Color(0xff534341),
                  fontSize: 12,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WeatherStat(
                  title: "Temperature",
                  measurement:
                      station.reading.temperatureWithUnit(unit, round: true),
                  icon: Icons.thermostat,
                  color: AppColors.temperature,
                ),
                WeatherStat(
                  title: "Wind Speed",
                  measurement: station.reading.windWithUnit(unit, round: true),
                  icon: Icons.air,
                  color: AppColors.wind,
                ),
                WeatherStat(
                  title: "Humidity",
                  measurement:
                      station.reading.humidityWithUnit(unit, round: true),
                  icon: Icons.water_drop_outlined,
                  color: AppColors.humidity,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
