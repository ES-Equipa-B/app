import 'package:app_sys_eng/models/station_card_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:app_sys_eng/widgets/get_data_graph.dart';
import 'package:flutter/services.dart';

class GraphFullScreen extends StatefulWidget {
  final String selectedValue;
  final StationCardData data;
  const GraphFullScreen(
      {super.key, required this.selectedValue, required this.data});

  @override
  State<GraphFullScreen> createState() => _GraphFullScreenState();
}

class _GraphFullScreenState extends State<GraphFullScreen> {
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
    var tempChart = showChartTemp(widget.selectedValue);
    var windChart = showChartWind(widget.selectedValue);
    var humChart = showChartHum(widget.selectedValue);
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
                  topTitles: AxisTitles(), rightTitles: AxisTitles()),
              lineBarsData: [
                LineChartBarData(
                    spots: tempChart[0],
                    color: const Color.fromARGB(255, 247, 94, 94)),
                LineChartBarData(
                    spots: windChart[0],
                    color: const Color.fromARGB(255, 122, 222, 126)),
                LineChartBarData(
                    spots: humChart[0],
                    color: const Color.fromARGB(255, 58, 66, 183)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
