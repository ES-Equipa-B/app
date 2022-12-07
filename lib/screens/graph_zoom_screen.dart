import 'package:app_sys_eng/models/graph_reading.dart';
import 'package:app_sys_eng/models/station.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:app_sys_eng/widgets/get_data_graph.dart';
import 'package:flutter/services.dart';

class GraphFullScreen extends StatefulWidget {
  final String selectedValue;
  final Station data;
  final GraphReadings graph;
  const GraphFullScreen(
      {super.key,
      required this.selectedValue,
      required this.data,
      required this.graph});

  @override
  State<GraphFullScreen> createState() => _GraphFullScreenState();
}

class _GraphFullScreenState extends State<GraphFullScreen> {
  double interval = 1;
  double intervalLeft = 5;
  @override
  void initState() {
    //set initial orentation to langscape
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var tempChart =
        showChartTemp(widget.selectedValue, widget.graph.valuesGraphTemp());
    var windChart =
        showChartWind(widget.selectedValue, widget.graph.valuesGraphHum());
    var humChart =
        showChartHum(widget.selectedValue, widget.graph.valuesGraphWind());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          '${widget.data.name} - ${widget.selectedValue}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.landscapeRight,
              DeviceOrientation.landscapeLeft,
              DeviceOrientation.portraitDown,
              DeviceOrientation.portraitUp,
            ]);
          },
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 15.0, right: 40, top: 10, bottom: 10),
        child: SizedBox(
          width: double.infinity,
          height: 300,
          child: LineChart(
            LineChartData(
              borderData: FlBorderData(show: false),
              gridData: FlGridData(show: true),
              titlesData: FlTitlesData(
                  topTitles: AxisTitles(),
                  rightTitles: AxisTitles(),
                  bottomTitles: AxisTitles(
                      sideTitles: _bottomTitles,
                      axisNameWidget: name(widget.selectedValue)),
                  leftTitles: AxisTitles(sideTitles: _leftTitles)),
              lineBarsData: [
                LineChartBarData(
                  spots: tempChart,
                  color: const Color.fromARGB(255, 247, 94, 94),
                ),
                LineChartBarData(
                  spots: windChart,
                  color: const Color.fromARGB(255, 122, 222, 126),
                ),
                LineChartBarData(
                  spots: humChart,
                  color: const Color.fromARGB(255, 58, 66, 183),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget name(String selected) {
    if (selected == 'Last hour') {
      return const Text(
        "Last 60 Minutes",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (selected == 'Last 6 hours') {
      return const Text(
        "Last 360 Minutes",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (selected == 'Last 24 hours') {
      return const Text(
        "Last 24 Hours",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (selected == 'Last 7 days') {
      return const Text(
        "Last 7 Days",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (selected == 'Last month') {
      return const Text(
        "Last 30 Month Days",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      return const Text(
        "Last 12 Months",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }

  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        interval: interval,
        getTitlesWidget: (value, meta) {
          String text = '';
          if (widget.selectedValue == "Last hour") {
            interval = 1;
            text = value.toStringAsFixed(0);
          } else if (widget.selectedValue == "Last 6 hours") {
            interval = 4;
            text = value.toStringAsFixed(0);
          } else if (widget.selectedValue == "Last 24 hours") {
            interval = 1;
            text = value.toStringAsFixed(0);
          } else if (widget.selectedValue == "Last 7 days") {
            interval = 1;
            text = value.toStringAsFixed(0);
          } else if (widget.selectedValue == "Last month") {
            interval = 2;
            text = value.toStringAsFixed(0);
          } else if (widget.selectedValue == "Last year") {
            interval = 1;
            text = value.toStringAsFixed(0);
          }
          return Transform.rotate(angle: 0, child: Text(text));
        },
      );
  SideTitles get _leftTitles => SideTitles(
        showTitles: true,
        reservedSize: 40,
        interval: intervalLeft,
        getTitlesWidget: (value, meta) {
          if (widget.selectedValue == "Last hour") {
            intervalLeft = 5;
          } else if (widget.selectedValue == "Last 6 hours") {
            intervalLeft = 4;
          } else if (widget.selectedValue == "Last 24 hours") {
            intervalLeft = 5;
          } else if (widget.selectedValue == "Last 7 days") {
            intervalLeft = 5;
          } else if (widget.selectedValue == "Last month") {
            intervalLeft = 5;
          } else if (widget.selectedValue == "Last year") {
            intervalLeft = 5;
          }
          String text = value.toStringAsFixed(1);

          return Text(text);
        },
      );
}
