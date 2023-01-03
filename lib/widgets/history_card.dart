import 'package:app_sys_eng/blocs/settings_bloc.dart';
import 'package:app_sys_eng/blocs/station_bloc.dart';
import 'package:app_sys_eng/colors.dart';
import 'package:app_sys_eng/models/reading_list.dart';
import 'package:app_sys_eng/models/time_frame.dart';
import 'package:app_sys_eng/screens/chart_full_screen.dart';
import 'package:app_sys_eng/widgets/history_chart.dart';
import 'package:app_sys_eng/widgets/history_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HistoryCard extends StatefulWidget {
  final StationBloc bloc;
  const HistoryCard({super.key, required this.bloc});

  @override
  State<HistoryCard> createState() => _HistoryCard();
}

class _HistoryCard extends State<HistoryCard> {
  static List<DropdownMenuItem<TimeFrame>> dropdownItems = TimeFrame.values
      .map(
        (e) => DropdownMenuItem(
          value: e,
          child: Text(e.display),
        ),
      )
      .toList(growable: false);

  double interval = 1;
  double intervalLeft = 5;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: settingsBloc.settings,
      builder: (context, settings) => StreamBuilder<ReadingList>(
        stream: widget.bloc.readings,
        builder: (context, snapshot) {
          if (settings.hasData && snapshot.hasData) {
            ReadingList val = snapshot.data!;

            return Material(
              color: AppColors.cardBG,
              type: MaterialType.card,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.grey.withOpacity(0.5), width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 12, right: 12, bottom: 10, top: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Weather History",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        StreamBuilder(
                          stream: widget.bloc.timeFrame,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var selected = snapshot.data!;
                              return DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  value: selected,
                                  items: dropdownItems,
                                  onChanged: (TimeFrame? newValue) {
                                    setState(() {
                                      if (newValue != null) {
                                        widget.bloc.changeTimeFrame(newValue);
                                      }
                                    });
                                  },
                                ),
                              );
                            } else {
                              return const Text("Loading...");
                            }
                          },
                        )
                      ],
                    ),
                    StreamBuilder(
                      stream: widget.bloc.timeFrame,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return HistoryChart(
                            readingList: val,
                            timeFrame: snapshot.data!,
                            height: 180,
                            unit: settings.data!.measurementUnit,
                          );
                        } else {
                          return const Text("Loading...");
                        }
                      },
                    ),
                    const Divider(
                      color: Color.fromARGB(255, 153, 153, 153),
                      height: 10,
                      thickness: 0.5,
                      indent: 8,
                      endIndent: 8,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 5.0, right: 10, left: 10),
                      child: HistoryTable(
                        min: val.min,
                        max: val.max,
                        avg: val.avg,
                        unit: settings.data!.measurementUnit,
                        onTapFullScreen: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  ChartFullScreen(bloc: widget.bloc),
                            ),
                          );

                          SystemChrome.setPreferredOrientations([]);
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        },
      ),
    );
  }
}
