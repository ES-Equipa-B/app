import 'package:app_sys_eng/colors.dart';
import 'package:app_sys_eng/models/measurement_unit.dart';
import 'package:app_sys_eng/models/reading_list.dart';
import 'package:app_sys_eng/models/time_frame.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

class HistoryChart extends StatelessWidget {
  final ReadingList readingList;
  final TimeFrame timeFrame;
  final double height;
  final MeasurementUnit unit;
  final bool fitInsideVertically;

  const HistoryChart({
    super.key,
    required this.readingList,
    required this.timeFrame,
    required this.height,
    required this.unit,
    this.fitInsideVertically = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget chart;
    if (readingList.readings.isEmpty) {
      chart = const Center(
        child: Text("No data available for this time frame"),
      );
    } else {
      chart = LineChart(
        LineChartData(
          borderData: FlBorderData(show: false),
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(),
            rightTitles: AxisTitles(),
            topTitles: AxisTitles(),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: bottomTitleWidgets,
                // interval: readingList.readings.length / 8,
                reservedSize: 35,
              ),
            ),
          ),
          lineBarsData: lineChartBarData,
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              fitInsideVertically: fitInsideVertically,
              fitInsideHorizontally: true,
              tooltipBgColor: Colors.white,
              tooltipBorder: BorderSide(color: Colors.grey.withOpacity(0.5)),
              getTooltipItems: tooltipItems,
              // fitInsideHorizontally: true,
              // fitInsideVertically: true,
            ),
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(10.0),
      width: double.infinity,
      height: height,
      child: chart,
    );
  }

  List<LineChartBarData> get lineChartBarData {
    List<FlSpot> temperatureSpots = [];
    List<FlSpot> humiditySpots = [];
    List<FlSpot> windSpots = [];
    int i = 0;
    for (final reading in readingList.readings) {
      if (reading.isFilled) {
        temperatureSpots.add(FlSpot(
          i.toDouble(),
          reading.temperature(unit)!,
        ));
        humiditySpots.add(FlSpot(
          i.toDouble(),
          reading.humidity(unit)! * 100,
        ));
        windSpots.add(FlSpot(
          i.toDouble(),
          reading.wind(unit)!,
        ));
      }
      i++;
    }
    return [
      LineChartBarData(spots: temperatureSpots, color: AppColors.temperature),
      LineChartBarData(spots: humiditySpots, color: AppColors.humidity),
      LineChartBarData(spots: windSpots, color: AppColors.wind),
    ];
  }

  List<LineTooltipItem?> tooltipItems(List<LineBarSpot> touchedSpots) {
    return touchedSpots.map((flSpot) {
      String text;
      Color color;

      switch (flSpot.barIndex) {
        case 0: // temperature
          text =
              readingList.readings[flSpot.x.toInt()].temperatureWithUnit(unit);
          color = AppColors.temperature;
          break;
        case 1:
          text = readingList.readings[flSpot.x.toInt()].humidityWithUnit(unit);
          color = AppColors.humidity;
          break;
        case 2:
          text = readingList.readings[flSpot.x.toInt()].windWithUnit(unit);
          color = AppColors.wind;
          break;
        default:
          return null;
      }
      return LineTooltipItem(
          text, TextStyle(color: color, fontWeight: FontWeight.w600));
    }).toList(growable: false);
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    DateTime timeStamp = readingList.readings[value.toInt()].timeStamp!;
    Text text;
    switch (timeFrame) {
      case TimeFrame.hour:
      case TimeFrame.sixhour:
      case TimeFrame.day:
        text = Text(
          DateFormat('kk:mm').format(timeStamp),
          textScaleFactor: 0.8,
        );
        break;
      case TimeFrame.week:
      case TimeFrame.month:
        text = Text(
          DateFormat('dd/MM').format(timeStamp),
          textScaleFactor: 0.8,
        );
        break;
      case TimeFrame.year:
        text = Text(
          DateFormat('MMM').format(timeStamp),
          textScaleFactor: 0.8,
        );
        break;
      default:
        text = Text(value.toString());
    }

    return SideTitleWidget(
      space: 15,
      axisSide: meta.axisSide,
      child: Transform.rotate(angle: math.pi / 4, child: text),
    );
  }
}
