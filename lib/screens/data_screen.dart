import 'dart:async';
import 'package:app_sys_eng/api/readings_api_provider.dart';
import 'package:app_sys_eng/api/station_api_provider.dart';
import 'package:app_sys_eng/blocs/settings_bloc.dart';
import 'package:app_sys_eng/blocs/station_bloc.dart';
import 'package:app_sys_eng/colors.dart';
import 'package:app_sys_eng/models/station.dart';
import 'package:app_sys_eng/screens/edit_station_screen.dart';
import 'package:app_sys_eng/widgets/history_card.dart';
import 'package:app_sys_eng/widgets/station_detail_card.dart';
import 'package:flutter/material.dart';

class DataScreen extends StatefulWidget {
  final int id;
  const DataScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  StationBloc bloc = StationBloc();

  @override
  void didChangeDependencies() {
    bloc = StationBloc();
    bloc.fetchStation(widget.id);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  var time = 0;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: settingsBloc.settings,
      builder: (context, settings) => StreamBuilder<Station>(
        stream: bloc.station,
        builder: (context, snapshot) {
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                scrolledUnderElevation: 0,
                elevation: 0,
                backgroundColor: Colors.white,
                title: Text(
                  snapshot.hasData ? snapshot.data!.name : "",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: snapshot.hasData
                    ? [
                        PopupMenuButton(
                          itemBuilder: (context) => [
                            const PopupMenuItem<int>(
                              value: 0,
                              child: Text("Edit"),
                            ),
                            const PopupMenuItem<int>(
                              value: 1,
                              child: Text("Wipe Data"),
                            ),
                            const PopupMenuItem<int>(
                              value: 2,
                              child: Text("Delete"),
                            ),
                          ],
                          onSelected: (item) =>
                              selecteditem(context, item, snapshot.data!),
                        )
                      ]
                    : null,
              ),
              body: Builder(
                builder: (context) {
                  if (snapshot.hasData & settings.hasData) {
                    Station data = snapshot.data!;
                    return RefreshIndicator(
                      triggerMode: RefreshIndicatorTriggerMode.anywhere,
                      onRefresh: () =>
                          Future.sync(() => bloc.fetchStation(widget.id)),
                      child: ListView(
                        padding: const EdgeInsets.only(bottom: 16),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: StationDetailCard(
                              station: data,
                              unit: settings.data!.measurementUnit,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0, right: 16.0, top: 5),
                            child: HistoryCard(
                              bloc: bloc,
                            ),
                          ),
                        ],
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
              ));
        },
      ),
    );
  }

  selecteditem(BuildContext context, int item, Station data) {
    switch (item) {
      case 0:
        navigateEditStation(context, data);
        break;
      case 1:
        _showDialogWipe(context);
        break;
      case 2:
        _showDialogDelete(context);
        break;
      default:
    }
  }

  Future<void> navigateEditStation(BuildContext context, Station d) async {
    bool? result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            EditStationScreen(id: d.id, name: d.name, phone: d.phone),
      ),
    );
    // if (!mounted) return;

    if (result == true) {
      bloc.fetchStation(widget.id);
    }
  }

  _showDialogDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete station?'),
          content: const Text(
              'This station and all it\'s weather data will be permanently deleted'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'No',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                StationApiProvider().deleteStation(widget.id).whenComplete(() {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop(true);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Station deleted with success"),
                  ));
                }).onError((error, stackTrace) {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Error: $error"),
                  ));
                  return false;
                });
              },
              child: const Text(
                'Yes',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }

  _showDialogWipe(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Wipe all data?'),
          content: const Text(
              'All the weather data from this station will be permanently deleted'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                ReadingsApiProvider().wipeData(widget.id).whenComplete(() {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Data wiped with success"),
                  ));
                  bloc.fetchStation(widget.id);
                }).onError((error, stackTrace) {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Error: $error"),
                  ));
                  return false;
                });
              },
              child: const Text(
                'Wipe',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }
}
