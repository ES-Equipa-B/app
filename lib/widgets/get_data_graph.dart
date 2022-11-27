import 'package:fl_chart/fl_chart.dart';
import 'package:collection/collection.dart';

//dummy data, mudar, bad programming xD
showChartTemp(String selectedValue) {
  if (selectedValue == "Last hour") {
    var values = [
      {
        'Total': const FlSpot(0, 11).x,
        'Val': const FlSpot(0, 11).y,
      },
      {
        'Total': const FlSpot(1, 32).x,
        'Val': const FlSpot(1, 32).y,
      },
      {
        'Total': const FlSpot(2, 15).x,
        'Val': const FlSpot(2, 15).y,
      },
      {
        'Total': const FlSpot(3, 16).x,
        'Val': const FlSpot(3, 16).y,
      },
      {
        'Total': const FlSpot(4, 18).x,
        'Val': const FlSpot(4, 18).y,
      },
      {
        'Total': const FlSpot(5, 20).x,
        'Val': const FlSpot(5, 20).y,
      },
      {
        'Total': const FlSpot(6, 21).x,
        'Val': const FlSpot(6, 21).y,
      },
      {
        'Total': const FlSpot(7, 22).x,
        'Val': const FlSpot(7, 22).y,
      },
      {
        'Total': const FlSpot(8, 20).x,
        'Val': const FlSpot(8, 20).y,
      },
    ];
    var p = <FlSpot>[
      const FlSpot(0, 11),
      const FlSpot(1, 32),
      const FlSpot(2, 15),
      const FlSpot(3, 16),
      const FlSpot(4, 18),
      const FlSpot(5, 20),
      const FlSpot(6, 21),
      const FlSpot(7, 22),
      const FlSpot(8, 20),
    ];

    double avg = values.map((m) => m['Val']!).average;
    double max = values.map((m) => m['Val']!).max;
    double min = values.map((m) => m['Val']!).min;

    return [
      p,
      avg.toStringAsFixed(1),
      max.toStringAsFixed(1),
      min.toStringAsFixed(1)
    ];
  } else if (selectedValue == 'Last 6 hours') {
    var values = [
      {
        'Total': const FlSpot(0, 1).x,
        'Val': const FlSpot(0, 1).y,
      },
      {
        'Total': const FlSpot(1, 3).x,
        'Val': const FlSpot(1, 3).y,
      },
      {
        'Total': const FlSpot(2, 10).x,
        'Val': const FlSpot(2, 10).y,
      },
      {
        'Total': const FlSpot(3, 7).x,
        'Val': const FlSpot(3, 7).y,
      },
      {
        'Total': const FlSpot(4, 12).x,
        'Val': const FlSpot(4, 12).y,
      },
      {
        'Total': const FlSpot(5, 13).x,
        'Val': const FlSpot(5, 13).y,
      },
      {
        'Total': const FlSpot(6, 17).x,
        'Val': const FlSpot(6, 17).y,
      },
      {
        'Total': const FlSpot(7, 15).x,
        'Val': const FlSpot(7, 15).y,
      },
      {
        'Total': const FlSpot(8, 20).x,
        'Val': const FlSpot(8, 20).y,
      },
    ];
    var p = <FlSpot>[
      const FlSpot(0, 12),
      const FlSpot(1, 11),
      const FlSpot(2, 10),
      const FlSpot(3, 7),
      const FlSpot(4, 6),
      const FlSpot(5, 3),
      const FlSpot(6, 11),
      const FlSpot(7, 15),
      const FlSpot(8, 8)
    ];

    double avg = values.map((m) => m['Val']!).average;
    double max = values.map((m) => m['Val']!).max;
    double min = values.map((m) => m['Val']!).min;

    return [
      p,
      avg.toStringAsFixed(1),
      max.toStringAsFixed(1),
      min.toStringAsFixed(1)
    ];
  } else if (selectedValue == 'Last 24 hours') {
    var values = [
      {
        'Total': const FlSpot(0, 1).x,
        'Val': const FlSpot(0, 1).y,
      },
      {
        'Total': const FlSpot(1, 3).x,
        'Val': const FlSpot(1, 3).y,
      },
      {
        'Total': const FlSpot(2, 10).x,
        'Val': const FlSpot(2, 10).y,
      },
      {
        'Total': const FlSpot(3, 7).x,
        'Val': const FlSpot(3, 7).y,
      },
      {
        'Total': const FlSpot(4, 12).x,
        'Val': const FlSpot(4, 12).y,
      },
      {
        'Total': const FlSpot(5, 13).x,
        'Val': const FlSpot(5, 13).y,
      },
      {
        'Total': const FlSpot(6, 17).x,
        'Val': const FlSpot(6, 17).y,
      },
      {
        'Total': const FlSpot(7, 15).x,
        'Val': const FlSpot(7, 15).y,
      },
      {
        'Total': const FlSpot(8, 20).x,
        'Val': const FlSpot(8, 20).y,
      },
    ];
    var p = <FlSpot>[
      const FlSpot(0, 11),
      const FlSpot(1, 11),
      const FlSpot(2, 11),
      const FlSpot(3, 17),
      const FlSpot(4, 18),
      const FlSpot(5, 11),
      const FlSpot(6, 10),
      const FlSpot(7, 15),
      const FlSpot(8, 8)
    ];

    double avg = values.map((m) => m['Val']!).average;
    double max = values.map((m) => m['Val']!).max;
    double min = values.map((m) => m['Val']!).min;

    return [
      p,
      avg.toStringAsFixed(1),
      max.toStringAsFixed(1),
      min.toStringAsFixed(1)
    ];
  } else if (selectedValue == 'Last 7 days') {
    var values = [
      {
        'Total': const FlSpot(0, 1).x,
        'Val': const FlSpot(0, 1).y,
      },
      {
        'Total': const FlSpot(1, 3).x,
        'Val': const FlSpot(1, 3).y,
      },
      {
        'Total': const FlSpot(2, 10).x,
        'Val': const FlSpot(2, 10).y,
      },
      {
        'Total': const FlSpot(3, 7).x,
        'Val': const FlSpot(3, 7).y,
      },
      {
        'Total': const FlSpot(4, 12).x,
        'Val': const FlSpot(4, 12).y,
      },
      {
        'Total': const FlSpot(5, 13).x,
        'Val': const FlSpot(5, 13).y,
      },
      {
        'Total': const FlSpot(6, 17).x,
        'Val': const FlSpot(6, 17).y,
      },
      {
        'Total': const FlSpot(7, 15).x,
        'Val': const FlSpot(7, 15).y,
      },
      {
        'Total': const FlSpot(8, 20).x,
        'Val': const FlSpot(8, 20).y,
      },
    ];
    var p = <FlSpot>[
      const FlSpot(0, 12),
      const FlSpot(1, 11),
      const FlSpot(2, 11),
      const FlSpot(3, 11),
      const FlSpot(4, 16),
      const FlSpot(5, 17),
      const FlSpot(6, 17),
      const FlSpot(7, 15),
      const FlSpot(8, 8)
    ];

    double avg = values.map((m) => m['Val']!).average;
    double max = values.map((m) => m['Val']!).max;
    double min = values.map((m) => m['Val']!).min;

    return [
      p,
      avg.toStringAsFixed(1),
      max.toStringAsFixed(1),
      min.toStringAsFixed(1)
    ];
  } else if (selectedValue == 'Last month') {
    var values = [
      {
        'Total': const FlSpot(0, 1).x,
        'Val': const FlSpot(0, 1).y,
      },
      {
        'Total': const FlSpot(1, 3).x,
        'Val': const FlSpot(1, 3).y,
      },
      {
        'Total': const FlSpot(2, 10).x,
        'Val': const FlSpot(2, 10).y,
      },
      {
        'Total': const FlSpot(3, 7).x,
        'Val': const FlSpot(3, 7).y,
      },
      {
        'Total': const FlSpot(4, 12).x,
        'Val': const FlSpot(4, 12).y,
      },
      {
        'Total': const FlSpot(5, 13).x,
        'Val': const FlSpot(5, 13).y,
      },
      {
        'Total': const FlSpot(6, 17).x,
        'Val': const FlSpot(6, 17).y,
      },
      {
        'Total': const FlSpot(7, 15).x,
        'Val': const FlSpot(7, 15).y,
      },
      {
        'Total': const FlSpot(8, 20).x,
        'Val': const FlSpot(8, 20).y,
      },
    ];
    var p = <FlSpot>[
      const FlSpot(0, 12),
      const FlSpot(1, 11),
      const FlSpot(2, 10),
      const FlSpot(3, 7),
      const FlSpot(4, 6),
      const FlSpot(5, 3),
      const FlSpot(6, 11),
      const FlSpot(7, 15),
      const FlSpot(8, 8)
    ];

    double avg = values.map((m) => m['Val']!).average;
    double max = values.map((m) => m['Val']!).max;
    double min = values.map((m) => m['Val']!).min;

    return [
      p,
      avg.toStringAsFixed(1),
      max.toStringAsFixed(1),
      min.toStringAsFixed(1)
    ];
  } else {
    var values = [
      {
        'Total': const FlSpot(0, 1).x,
        'Val': const FlSpot(0, 1).y,
      },
      {
        'Total': const FlSpot(1, 3).x,
        'Val': const FlSpot(1, 3).y,
      },
      {
        'Total': const FlSpot(2, 10).x,
        'Val': const FlSpot(2, 10).y,
      },
      {
        'Total': const FlSpot(3, 7).x,
        'Val': const FlSpot(3, 7).y,
      },
      {
        'Total': const FlSpot(4, 12).x,
        'Val': const FlSpot(4, 12).y,
      },
      {
        'Total': const FlSpot(5, 13).x,
        'Val': const FlSpot(5, 13).y,
      },
      {
        'Total': const FlSpot(6, 17).x,
        'Val': const FlSpot(6, 17).y,
      },
      {
        'Total': const FlSpot(7, 15).x,
        'Val': const FlSpot(7, 15).y,
      },
      {
        'Total': const FlSpot(8, 20).x,
        'Val': const FlSpot(8, 20).y,
      },
    ];
    var p = <FlSpot>[
      const FlSpot(0, 14),
      const FlSpot(1, 1),
      const FlSpot(2, 10),
      const FlSpot(3, 15),
      const FlSpot(4, 16),
      const FlSpot(5, 17),
      const FlSpot(6, 10),
      const FlSpot(7, 11),
      const FlSpot(8, 8)
    ];

    double avg = values.map((m) => m['Val']!).average;
    double max = values.map((m) => m['Val']!).max;
    double min = values.map((m) => m['Val']!).min;

    return [
      p,
      avg.toStringAsFixed(1),
      max.toStringAsFixed(1),
      min.toStringAsFixed(1)
    ];
  }
}

showChartWind(String selectedValue) {
  if (selectedValue == "Last hour") {
    var values = [
      {
        'Total': const FlSpot(0, 1).x,
        'Val': const FlSpot(0, 1).y,
      },
      {
        'Total': const FlSpot(1, 3).x,
        'Val': const FlSpot(1, 3).y,
      },
      {
        'Total': const FlSpot(2, 10).x,
        'Val': const FlSpot(2, 10).y,
      },
      {
        'Total': const FlSpot(3, 7).x,
        'Val': const FlSpot(3, 7).y,
      },
      {
        'Total': const FlSpot(4, 12).x,
        'Val': const FlSpot(4, 12).y,
      },
      {
        'Total': const FlSpot(5, 13).x,
        'Val': const FlSpot(5, 13).y,
      },
      {
        'Total': const FlSpot(6, 17).x,
        'Val': const FlSpot(6, 17).y,
      },
      {
        'Total': const FlSpot(7, 15).x,
        'Val': const FlSpot(7, 15).y,
      },
      {
        'Total': const FlSpot(8, 20).x,
        'Val': const FlSpot(8, 20).y,
      },
    ];
    var p = <FlSpot>[
      const FlSpot(0, 7),
      const FlSpot(1, 5),
      const FlSpot(2, 5),
      const FlSpot(3, 7),
      const FlSpot(4, 19),
      const FlSpot(5, 11),
      const FlSpot(6, 12),
      const FlSpot(7, 15),
      const FlSpot(8, 26),
    ];

    double avg = values.map((m) => m['Val']!).average;
    double max = values.map((m) => m['Val']!).max;
    double min = values.map((m) => m['Val']!).min;

    return [
      p,
      avg.toStringAsFixed(1),
      max.toStringAsFixed(1),
      min.toStringAsFixed(1)
    ];
  } else if (selectedValue == 'Last 6 hours') {
    var values = [
      {
        'Total': const FlSpot(0, 1).x,
        'Val': const FlSpot(0, 1).y,
      },
      {
        'Total': const FlSpot(1, 3).x,
        'Val': const FlSpot(1, 3).y,
      },
      {
        'Total': const FlSpot(2, 10).x,
        'Val': const FlSpot(2, 10).y,
      },
      {
        'Total': const FlSpot(3, 7).x,
        'Val': const FlSpot(3, 7).y,
      },
      {
        'Total': const FlSpot(4, 12).x,
        'Val': const FlSpot(4, 12).y,
      },
      {
        'Total': const FlSpot(5, 13).x,
        'Val': const FlSpot(5, 13).y,
      },
      {
        'Total': const FlSpot(6, 17).x,
        'Val': const FlSpot(6, 17).y,
      },
      {
        'Total': const FlSpot(7, 15).x,
        'Val': const FlSpot(7, 15).y,
      },
      {
        'Total': const FlSpot(8, 20).x,
        'Val': const FlSpot(8, 20).y,
      },
    ];
    var p = <FlSpot>[
      const FlSpot(0, 12),
      const FlSpot(1, 11),
      const FlSpot(2, 10),
      const FlSpot(3, 7),
      const FlSpot(4, 6),
      const FlSpot(5, 3),
      const FlSpot(6, 11),
      const FlSpot(7, 15),
      const FlSpot(8, 8)
    ];

    double avg = values.map((m) => m['Val']!).average;
    double max = values.map((m) => m['Val']!).max;
    double min = values.map((m) => m['Val']!).min;

    return [
      p,
      avg.toStringAsFixed(1),
      max.toStringAsFixed(1),
      min.toStringAsFixed(1)
    ];
  } else if (selectedValue == 'Last 24 hours') {
    var values = [
      {
        'Total': const FlSpot(0, 1).x,
        'Val': const FlSpot(0, 1).y,
      },
      {
        'Total': const FlSpot(1, 3).x,
        'Val': const FlSpot(1, 3).y,
      },
      {
        'Total': const FlSpot(2, 10).x,
        'Val': const FlSpot(2, 10).y,
      },
      {
        'Total': const FlSpot(3, 7).x,
        'Val': const FlSpot(3, 7).y,
      },
      {
        'Total': const FlSpot(4, 12).x,
        'Val': const FlSpot(4, 12).y,
      },
      {
        'Total': const FlSpot(5, 13).x,
        'Val': const FlSpot(5, 13).y,
      },
      {
        'Total': const FlSpot(6, 17).x,
        'Val': const FlSpot(6, 17).y,
      },
      {
        'Total': const FlSpot(7, 15).x,
        'Val': const FlSpot(7, 15).y,
      },
      {
        'Total': const FlSpot(8, 20).x,
        'Val': const FlSpot(8, 20).y,
      },
    ];
    var p = <FlSpot>[
      const FlSpot(0, 11),
      const FlSpot(1, 11),
      const FlSpot(2, 11),
      const FlSpot(3, 17),
      const FlSpot(4, 18),
      const FlSpot(5, 11),
      const FlSpot(6, 10),
      const FlSpot(7, 15),
      const FlSpot(8, 8)
    ];

    double avg = values.map((m) => m['Val']!).average;
    double max = values.map((m) => m['Val']!).max;
    double min = values.map((m) => m['Val']!).min;

    return [
      p,
      avg.toStringAsFixed(1),
      max.toStringAsFixed(1),
      min.toStringAsFixed(1)
    ];
  } else if (selectedValue == 'Last 7 days') {
    var values = [
      {
        'Total': const FlSpot(0, 1).x,
        'Val': const FlSpot(0, 1).y,
      },
      {
        'Total': const FlSpot(1, 3).x,
        'Val': const FlSpot(1, 3).y,
      },
      {
        'Total': const FlSpot(2, 10).x,
        'Val': const FlSpot(2, 10).y,
      },
      {
        'Total': const FlSpot(3, 7).x,
        'Val': const FlSpot(3, 7).y,
      },
      {
        'Total': const FlSpot(4, 12).x,
        'Val': const FlSpot(4, 12).y,
      },
      {
        'Total': const FlSpot(5, 13).x,
        'Val': const FlSpot(5, 13).y,
      },
      {
        'Total': const FlSpot(6, 17).x,
        'Val': const FlSpot(6, 17).y,
      },
      {
        'Total': const FlSpot(7, 15).x,
        'Val': const FlSpot(7, 15).y,
      },
      {
        'Total': const FlSpot(8, 20).x,
        'Val': const FlSpot(8, 20).y,
      },
    ];
    var p = <FlSpot>[
      const FlSpot(0, 12),
      const FlSpot(1, 11),
      const FlSpot(2, 11),
      const FlSpot(3, 11),
      const FlSpot(4, 16),
      const FlSpot(5, 17),
      const FlSpot(6, 17),
      const FlSpot(7, 15),
      const FlSpot(8, 8)
    ];

    double avg = values.map((m) => m['Val']!).average;
    double max = values.map((m) => m['Val']!).max;
    double min = values.map((m) => m['Val']!).min;

    return [
      p,
      avg.toStringAsFixed(1),
      max.toStringAsFixed(1),
      min.toStringAsFixed(1)
    ];
  } else if (selectedValue == 'Last month') {
    var values = [
      {
        'Total': const FlSpot(0, 1).x,
        'Val': const FlSpot(0, 1).y,
      },
      {
        'Total': const FlSpot(1, 3).x,
        'Val': const FlSpot(1, 3).y,
      },
      {
        'Total': const FlSpot(2, 10).x,
        'Val': const FlSpot(2, 10).y,
      },
      {
        'Total': const FlSpot(3, 7).x,
        'Val': const FlSpot(3, 7).y,
      },
      {
        'Total': const FlSpot(4, 12).x,
        'Val': const FlSpot(4, 12).y,
      },
      {
        'Total': const FlSpot(5, 13).x,
        'Val': const FlSpot(5, 13).y,
      },
      {
        'Total': const FlSpot(6, 17).x,
        'Val': const FlSpot(6, 17).y,
      },
      {
        'Total': const FlSpot(7, 15).x,
        'Val': const FlSpot(7, 15).y,
      },
      {
        'Total': const FlSpot(8, 20).x,
        'Val': const FlSpot(8, 20).y,
      },
    ];
    var p = <FlSpot>[
      const FlSpot(0, 12),
      const FlSpot(1, 11),
      const FlSpot(2, 10),
      const FlSpot(3, 7),
      const FlSpot(4, 6),
      const FlSpot(5, 3),
      const FlSpot(6, 11),
      const FlSpot(7, 15),
      const FlSpot(8, 8)
    ];

    double avg = values.map((m) => m['Val']!).average;
    double max = values.map((m) => m['Val']!).max;
    double min = values.map((m) => m['Val']!).min;

    return [
      p,
      avg.toStringAsFixed(1),
      max.toStringAsFixed(1),
      min.toStringAsFixed(1)
    ];
  } else {
    var values = [
      {
        'Total': const FlSpot(0, 1).x,
        'Val': const FlSpot(0, 1).y,
      },
      {
        'Total': const FlSpot(1, 3).x,
        'Val': const FlSpot(1, 3).y,
      },
      {
        'Total': const FlSpot(2, 10).x,
        'Val': const FlSpot(2, 10).y,
      },
      {
        'Total': const FlSpot(3, 7).x,
        'Val': const FlSpot(3, 7).y,
      },
      {
        'Total': const FlSpot(4, 12).x,
        'Val': const FlSpot(4, 12).y,
      },
      {
        'Total': const FlSpot(5, 13).x,
        'Val': const FlSpot(5, 13).y,
      },
      {
        'Total': const FlSpot(6, 17).x,
        'Val': const FlSpot(6, 17).y,
      },
      {
        'Total': const FlSpot(7, 15).x,
        'Val': const FlSpot(7, 15).y,
      },
      {
        'Total': const FlSpot(8, 20).x,
        'Val': const FlSpot(8, 20).y,
      },
    ];
    var p = <FlSpot>[
      const FlSpot(0, 14),
      const FlSpot(1, 1),
      const FlSpot(2, 10),
      const FlSpot(3, 15),
      const FlSpot(4, 16),
      const FlSpot(5, 17),
      const FlSpot(6, 10),
      const FlSpot(7, 11),
      const FlSpot(8, 8)
    ];

    double avg = values.map((m) => m['Val']!).average;
    double max = values.map((m) => m['Val']!).max;
    double min = values.map((m) => m['Val']!).min;

    return [
      p,
      avg.toStringAsFixed(1),
      max.toStringAsFixed(1),
      min.toStringAsFixed(1)
    ];
  }
}

showChartHum(String selectedValue) {
  if (selectedValue == "Last hour") {
    var values = [
      {
        'Total': const FlSpot(0, 1).x,
        'Val': const FlSpot(0, 1).y,
      },
      {
        'Total': const FlSpot(1, 3).x,
        'Val': const FlSpot(1, 3).y,
      },
      {
        'Total': const FlSpot(2, 10).x,
        'Val': const FlSpot(2, 10).y,
      },
      {
        'Total': const FlSpot(3, 7).x,
        'Val': const FlSpot(3, 7).y,
      },
      {
        'Total': const FlSpot(4, 12).x,
        'Val': const FlSpot(4, 12).y,
      },
      {
        'Total': const FlSpot(5, 13).x,
        'Val': const FlSpot(5, 13).y,
      },
      {
        'Total': const FlSpot(6, 17).x,
        'Val': const FlSpot(6, 17).y,
      },
      {
        'Total': const FlSpot(7, 15).x,
        'Val': const FlSpot(7, 15).y,
      },
      {
        'Total': const FlSpot(8, 20).x,
        'Val': const FlSpot(8, 20).y,
      },
    ];
    var p = <FlSpot>[
      const FlSpot(0, 1),
      const FlSpot(1, 3),
      const FlSpot(2, 10),
      const FlSpot(3, 7),
      const FlSpot(4, 12),
      const FlSpot(5, 13),
      const FlSpot(6, 17),
      const FlSpot(7, 15),
      const FlSpot(8, 20),
    ];

    double avg = values.map((m) => m['Val']!).average;
    double max = values.map((m) => m['Val']!).max;
    double min = values.map((m) => m['Val']!).min;

    return [
      p,
      avg.toStringAsFixed(1),
      max.toStringAsFixed(1),
      min.toStringAsFixed(1)
    ];
  } else if (selectedValue == 'Last 6 hours') {
    var values = [
      {
        'Total': const FlSpot(0, 1).x,
        'Val': const FlSpot(0, 1).y,
      },
      {
        'Total': const FlSpot(1, 3).x,
        'Val': const FlSpot(1, 3).y,
      },
      {
        'Total': const FlSpot(2, 10).x,
        'Val': const FlSpot(2, 10).y,
      },
      {
        'Total': const FlSpot(3, 7).x,
        'Val': const FlSpot(3, 7).y,
      },
      {
        'Total': const FlSpot(4, 12).x,
        'Val': const FlSpot(4, 12).y,
      },
      {
        'Total': const FlSpot(5, 13).x,
        'Val': const FlSpot(5, 13).y,
      },
      {
        'Total': const FlSpot(6, 17).x,
        'Val': const FlSpot(6, 17).y,
      },
      {
        'Total': const FlSpot(7, 15).x,
        'Val': const FlSpot(7, 15).y,
      },
      {
        'Total': const FlSpot(8, 20).x,
        'Val': const FlSpot(8, 20).y,
      },
    ];
    var p = <FlSpot>[
      const FlSpot(0, 12),
      const FlSpot(1, 11),
      const FlSpot(2, 10),
      const FlSpot(3, 7),
      const FlSpot(4, 6),
      const FlSpot(5, 3),
      const FlSpot(6, 11),
      const FlSpot(7, 15),
      const FlSpot(8, 8)
    ];

    double avg = values.map((m) => m['Val']!).average;
    double max = values.map((m) => m['Val']!).max;
    double min = values.map((m) => m['Val']!).min;

    return [
      p,
      avg.toStringAsFixed(1),
      max.toStringAsFixed(1),
      min.toStringAsFixed(1)
    ];
  } else if (selectedValue == 'Last 24 hours') {
    var values = [
      {
        'Total': const FlSpot(0, 1).x,
        'Val': const FlSpot(0, 1).y,
      },
      {
        'Total': const FlSpot(1, 3).x,
        'Val': const FlSpot(1, 3).y,
      },
      {
        'Total': const FlSpot(2, 10).x,
        'Val': const FlSpot(2, 10).y,
      },
      {
        'Total': const FlSpot(3, 7).x,
        'Val': const FlSpot(3, 7).y,
      },
      {
        'Total': const FlSpot(4, 12).x,
        'Val': const FlSpot(4, 12).y,
      },
      {
        'Total': const FlSpot(5, 13).x,
        'Val': const FlSpot(5, 13).y,
      },
      {
        'Total': const FlSpot(6, 17).x,
        'Val': const FlSpot(6, 17).y,
      },
      {
        'Total': const FlSpot(7, 15).x,
        'Val': const FlSpot(7, 15).y,
      },
      {
        'Total': const FlSpot(8, 20).x,
        'Val': const FlSpot(8, 20).y,
      },
    ];
    var p = <FlSpot>[
      const FlSpot(0, 11),
      const FlSpot(1, 11),
      const FlSpot(2, 11),
      const FlSpot(3, 17),
      const FlSpot(4, 18),
      const FlSpot(5, 11),
      const FlSpot(6, 10),
      const FlSpot(7, 15),
      const FlSpot(8, 8)
    ];

    double avg = values.map((m) => m['Val']!).average;
    double max = values.map((m) => m['Val']!).max;
    double min = values.map((m) => m['Val']!).min;

    return [
      p,
      avg.toStringAsFixed(1),
      max.toStringAsFixed(1),
      min.toStringAsFixed(1)
    ];
  } else if (selectedValue == 'Last 7 days') {
    var values = [
      {
        'Total': const FlSpot(0, 1).x,
        'Val': const FlSpot(0, 1).y,
      },
      {
        'Total': const FlSpot(1, 3).x,
        'Val': const FlSpot(1, 3).y,
      },
      {
        'Total': const FlSpot(2, 10).x,
        'Val': const FlSpot(2, 10).y,
      },
      {
        'Total': const FlSpot(3, 7).x,
        'Val': const FlSpot(3, 7).y,
      },
      {
        'Total': const FlSpot(4, 12).x,
        'Val': const FlSpot(4, 12).y,
      },
      {
        'Total': const FlSpot(5, 13).x,
        'Val': const FlSpot(5, 13).y,
      },
      {
        'Total': const FlSpot(6, 17).x,
        'Val': const FlSpot(6, 17).y,
      },
      {
        'Total': const FlSpot(7, 15).x,
        'Val': const FlSpot(7, 15).y,
      },
      {
        'Total': const FlSpot(8, 20).x,
        'Val': const FlSpot(8, 20).y,
      },
    ];
    var p = <FlSpot>[
      const FlSpot(0, 12),
      const FlSpot(1, 11),
      const FlSpot(2, 11),
      const FlSpot(3, 11),
      const FlSpot(4, 16),
      const FlSpot(5, 17),
      const FlSpot(6, 17),
      const FlSpot(7, 15),
      const FlSpot(8, 8)
    ];

    double avg = values.map((m) => m['Val']!).average;
    double max = values.map((m) => m['Val']!).max;
    double min = values.map((m) => m['Val']!).min;

    return [
      p,
      avg.toStringAsFixed(1),
      max.toStringAsFixed(1),
      min.toStringAsFixed(1)
    ];
  } else if (selectedValue == 'Last month') {
    var values = [
      {
        'Total': const FlSpot(0, 1).x,
        'Val': const FlSpot(0, 1).y,
      },
      {
        'Total': const FlSpot(1, 3).x,
        'Val': const FlSpot(1, 3).y,
      },
      {
        'Total': const FlSpot(2, 10).x,
        'Val': const FlSpot(2, 10).y,
      },
      {
        'Total': const FlSpot(3, 7).x,
        'Val': const FlSpot(3, 7).y,
      },
      {
        'Total': const FlSpot(4, 12).x,
        'Val': const FlSpot(4, 12).y,
      },
      {
        'Total': const FlSpot(5, 13).x,
        'Val': const FlSpot(5, 13).y,
      },
      {
        'Total': const FlSpot(6, 17).x,
        'Val': const FlSpot(6, 17).y,
      },
      {
        'Total': const FlSpot(7, 15).x,
        'Val': const FlSpot(7, 15).y,
      },
      {
        'Total': const FlSpot(8, 20).x,
        'Val': const FlSpot(8, 20).y,
      },
    ];
    var p = <FlSpot>[
      const FlSpot(0, 12),
      const FlSpot(1, 11),
      const FlSpot(2, 10),
      const FlSpot(3, 7),
      const FlSpot(4, 6),
      const FlSpot(5, 3),
      const FlSpot(6, 11),
      const FlSpot(7, 15),
      const FlSpot(8, 8)
    ];

    double avg = values.map((m) => m['Val']!).average;
    double max = values.map((m) => m['Val']!).max;
    double min = values.map((m) => m['Val']!).min;

    return [
      p,
      avg.toStringAsFixed(1),
      max.toStringAsFixed(1),
      min.toStringAsFixed(1)
    ];
  } else {
    var values = [
      {
        'Total': const FlSpot(0, 1).x,
        'Val': const FlSpot(0, 1).y,
      },
      {
        'Total': const FlSpot(1, 3).x,
        'Val': const FlSpot(1, 3).y,
      },
      {
        'Total': const FlSpot(2, 10).x,
        'Val': const FlSpot(2, 10).y,
      },
      {
        'Total': const FlSpot(3, 7).x,
        'Val': const FlSpot(3, 7).y,
      },
      {
        'Total': const FlSpot(4, 12).x,
        'Val': const FlSpot(4, 12).y,
      },
      {
        'Total': const FlSpot(5, 13).x,
        'Val': const FlSpot(5, 13).y,
      },
      {
        'Total': const FlSpot(6, 17).x,
        'Val': const FlSpot(6, 17).y,
      },
      {
        'Total': const FlSpot(7, 15).x,
        'Val': const FlSpot(7, 15).y,
      },
      {
        'Total': const FlSpot(8, 20).x,
        'Val': const FlSpot(8, 20).y,
      },
    ];
    var p = <FlSpot>[
      const FlSpot(0, 14),
      const FlSpot(1, 1),
      const FlSpot(2, 10),
      const FlSpot(3, 15),
      const FlSpot(4, 16),
      const FlSpot(5, 17),
      const FlSpot(6, 10),
      const FlSpot(7, 11),
      const FlSpot(8, 8)
    ];

    double avg = values.map((m) => m['Val']!).average;
    double max = values.map((m) => m['Val']!).max;
    double min = values.map((m) => m['Val']!).min;

    return [
      p,
      avg.toStringAsFixed(1),
      max.toStringAsFixed(1),
      min.toStringAsFixed(1)
    ];
  }
}
