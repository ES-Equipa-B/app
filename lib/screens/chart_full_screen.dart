import 'package:app_sys_eng/blocs/settings_bloc.dart';
import 'package:app_sys_eng/blocs/station_bloc.dart';
import 'package:app_sys_eng/models/station.dart';
import 'package:app_sys_eng/models/time_frame.dart';
import 'package:app_sys_eng/widgets/history_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChartFullScreen extends StatefulWidget {
  final StationBloc bloc;
  const ChartFullScreen({super.key, required this.bloc});

  @override
  State<ChartFullScreen> createState() => _ChartFullScreenState();
}

class _ChartFullScreenState extends State<ChartFullScreen> {
  String title = "Loading...";

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    setTitle();

    super.initState();
  }

  void setTitle() async {
    Station station = await widget.bloc.station.first;
    TimeFrame timeFrame = await widget.bloc.timeFrame.first;
    setState(() {
      title = '${station.name} - ${timeFrame.display}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: settingsBloc.settings,
        builder: (context, settings) => StreamBuilder(
          stream: widget.bloc.timeFrame,
          builder: (context, timeFrame) {
            return StreamBuilder(
              stream: widget.bloc.readings,
              builder: (context, readings) {
                if (settings.hasData && timeFrame.hasData && readings.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: HistoryChart(
                      readingList: readings.data!,
                      timeFrame: timeFrame.data!,
                      height: MediaQuery.of(context).size.height,
                      unit: settings.data!.measurementUnit,
                      fitInsideVertically: true,
                    ),
                  );
                } else {
                  return const Text("Loading...");
                }
              },
            );
          },
        ),
      ),
    );
  }
}
