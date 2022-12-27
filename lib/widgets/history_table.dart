import 'package:app_sys_eng/models/measurement_unit.dart';
import 'package:app_sys_eng/models/reading.dart';
import 'package:flutter/material.dart';

class HistoryTable extends StatelessWidget {
  final Reading min, max, avg;
  final Function onTapFullScreen;
  final MeasurementUnit unit;

  const HistoryTable(
      {super.key,
      required this.min,
      required this.max,
      required this.avg,
      required this.onTapFullScreen,
      required this.unit});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              child: const Icon(
                Icons.fullscreen,
              ),
              onTap: () => onTapFullScreen(),
            ),
            const SizedBox(height: 15),
            const Text(
              'Average:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Maximum:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Minimum:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: [
              Row(
                children: const [
                  Text(
                    'Temp.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.thermostat)
                ],
              ),
              const SizedBox(height: 15),
              Text(avg.temperatureWithUnit(unit)),
              const SizedBox(height: 15),
              Text(max.temperatureWithUnit(unit)),
              const SizedBox(height: 15),
              Text(min.temperatureWithUnit(unit))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: [
              Row(
                children: const [
                  Text(
                    'Wind.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.air)
                ],
              ),
              const SizedBox(height: 15),
              Text(avg.windWithUnit(unit)),
              const SizedBox(height: 15),
              Text(max.windWithUnit(unit)),
              const SizedBox(height: 15),
              Text(min.windWithUnit(unit))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: [
              Row(
                children: const [
                  Text(
                    'Humd.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.water_drop_outlined)
                ],
              ),
              const SizedBox(height: 15),
              Text(avg.humidityWithUnit(unit)),
              const SizedBox(height: 15),
              Text(max.humidityWithUnit(unit)),
              const SizedBox(height: 15),
              Text(min.humidityWithUnit(unit))
            ],
          ),
        )
      ],
    );
  }
}
