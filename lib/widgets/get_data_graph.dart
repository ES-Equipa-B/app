import 'package:fl_chart/fl_chart.dart';

//dummy data, mudar, bad programming xD
showChartTemp(String selectedValue) {
  if (selectedValue == "Last hour") {
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

    return p;
  } else if (selectedValue == 'Last 6 hours') {
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

    return p;
  } else if (selectedValue == 'Last 24 hours') {
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

    return p;
  } else if (selectedValue == 'Last 7 days') {
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

    return p;
  } else if (selectedValue == 'Last month') {
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

    return p;
  } else {
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

    return p;
  }
}

showChartWind(String selectedValue) {
  if (selectedValue == "Last hour") {
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
    return p;
  } else if (selectedValue == 'Last 6 hours') {
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
    return p;
  } else if (selectedValue == 'Last 24 hours') {
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
    return p;
  } else if (selectedValue == 'Last 7 days') {
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
    return p;
  } else if (selectedValue == 'Last month') {
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
    return p;
  } else {
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
    return p;
  }
}

showChartHum(String selectedValue) {
  if (selectedValue == "Last hour") {
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

    return p;
  } else if (selectedValue == 'Last 6 hours') {
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

    return p;
  } else if (selectedValue == 'Last 24 hours') {
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

    return p;
  } else if (selectedValue == 'Last 7 days') {
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

    return p;
  } else if (selectedValue == 'Last month') {
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

    return p;
  } else {
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

    return p;
  }
}
