import 'package:fl_chart/fl_chart.dart';

///////////////////////////////////////////////
///////////////////TEMP////////////////////////
//////////////////////////////////////////////

showChartTemp(String selectedValue, List<dynamic> valGraph) {
  if (selectedValue == "Last hour") {
    List<FlSpot> p = [];
    List<int> index = [];
    int i = 0;
    for (var element in valGraph) {
      if (element == null) {
        continue;
      } else {
        p.insert(i, FlSpot(i.toDouble(), element));
      }
      i++;
    }
    return p;
  } else if (selectedValue == 'Last 6 hours') {
    List<FlSpot> p = [];
    int i = 0;
    for (var element in valGraph) {
      if (element == null) {
        continue;
      } else {
        p.insert(i, FlSpot(i.toDouble(), element));
      }
      i++;
    }
    return p;
  } else if (selectedValue == 'Last 24 hours') {
    List<FlSpot> p = [];
    int i = 0;
    for (var element in valGraph) {
      if (element == null) {
        continue;
      } else {
        p.insert(i, FlSpot(i.toDouble(), element));
      }
      i++;
    }
    return p;
  } else if (selectedValue == 'Last 7 days') {
    List<FlSpot> p = [];
    int i = 0;
    for (var element in valGraph) {
      if (element == null) {
        continue;
      } else {
        p.insert(i, FlSpot(i.toDouble(), element));
      }
      i++;
    }
    return p;
  } else if (selectedValue == 'Last month') {
    List<FlSpot> p = [];
    int i = 0;
    for (var element in valGraph) {
      if (element == null) {
        continue;
      } else {
        p.insert(i, FlSpot(i.toDouble(), element));
      }
      i++;
    }
    return p;
  } else {
    List<FlSpot> p = [];
    int i = 0;
    for (var element in valGraph) {
      if (element == null) {
        continue;
      } else {
        p.insert(i, FlSpot(i.toDouble(), element));
      }
      i++;
    }
    return p;
  }
}

///////////////////////////////////////////////
///////////////////WIND////////////////////////
//////////////////////////////////////////////

showChartWind(String selectedValue, List<dynamic> valGraph) {
  if (selectedValue == "Last hour") {
    List<FlSpot> p = [];
    int i = 0;
    for (var element in valGraph) {
      if (element == null) {
        continue;
      } else {
        p.insert(i, FlSpot(i.toDouble(), element));
      }
      i++;
    }
    return p;
  } else if (selectedValue == 'Last 6 hours') {
    List<FlSpot> p = [];
    int i = 0;
    for (var element in valGraph) {
      if (element == null) {
        continue;
      } else {
        p.insert(i, FlSpot(i.toDouble(), element));
      }
      i++;
    }
    return p;
  } else if (selectedValue == 'Last 24 hours') {
    List<FlSpot> p = [];
    int i = 0;
    for (var element in valGraph) {
      if (element == null) {
        continue;
      } else {
        p.insert(i, FlSpot(i.toDouble(), element));
      }
      i++;
    }
    return p;
  } else if (selectedValue == 'Last 7 days') {
    List<FlSpot> p = [];
    int i = 0;
    for (var element in valGraph) {
      if (element == null) {
        continue;
      } else {
        p.insert(i, FlSpot(i.toDouble(), element));
      }
      i++;
    }
    return p;
  } else if (selectedValue == 'Last month') {
    List<FlSpot> p = [];
    int i = 0;
    for (var element in valGraph) {
      if (element == null) {
        continue;
      } else {
        p.insert(i, FlSpot(i.toDouble(), element));
      }
      i++;
    }
    return p;
  } else {
    List<FlSpot> p = [];
    int i = 0;
    for (var element in valGraph) {
      if (element == null) {
        continue;
      } else {
        p.insert(i, FlSpot(i.toDouble(), element));
      }
      i++;
    }
    return p;
  }
}

///////////////////////////////////////////////
///////////////////HUMI////////////////////////
//////////////////////////////////////////////

showChartHum(String selectedValue, List<dynamic> valGraph) {
  if (selectedValue == "Last hour") {
    List<FlSpot> p = [];
    int i = 0;
    for (var element in valGraph) {
      if (element == null) {
        continue;
      } else {
        p.insert(i, FlSpot(i.toDouble(), element));
      }
      i++;
    }
    return p;
  } else if (selectedValue == 'Last 6 hours') {
    List<FlSpot> p = [];
    int i = 0;
    for (var element in valGraph) {
      if (element == null) {
        continue;
      } else {
        p.insert(i, FlSpot(i.toDouble(), element));
      }
      i++;
    }
    return p;
  } else if (selectedValue == 'Last 24 hours') {
    List<FlSpot> p = [];
    int i = 0;
    for (var element in valGraph) {
      if (element == null) {
        continue;
      } else {
        p.insert(i, FlSpot(i.toDouble(), element));
      }
      i++;
    }
    return p;
  } else if (selectedValue == 'Last 7 days') {
    List<FlSpot> p = [];
    int i = 0;
    for (var element in valGraph) {
      if (element == null) {
        continue;
      } else {
        p.insert(i, FlSpot(i.toDouble(), element));
      }
      i++;
    }
    return p;
  } else if (selectedValue == 'Last month') {
    List<FlSpot> p = [];
    int i = 0;
    for (var element in valGraph) {
      if (element == null) {
        continue;
      } else {
        p.insert(i, FlSpot(i.toDouble(), element));
      }
      i++;
    }
    return p;
  } else {
    List<FlSpot> p = [];
    int i = 0;
    for (var element in valGraph) {
      if (element == null) {
        continue;
      } else {
        p.insert(i, FlSpot(i.toDouble(), element));
      }
      i++;
    }
    return p;
  }
}
