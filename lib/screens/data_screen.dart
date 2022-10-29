import 'dart:async';
import 'package:app_sys_eng/api/get_station.dart';
import 'package:app_sys_eng/widgets/station_detail_card.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:app_sys_eng/widgets/station_card.dart';
import 'package:flutter/material.dart';

import '../models/station_card_data.dart';

class DataScreen extends StatefulWidget {
  final int id;
  const DataScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  late Future<StationCardData> station;

  @override
  void initState() {
    super.initState();
    station = getStation(widget.id);
  }

  var time = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<StationCardData>(
      future: station,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          StationCardData data = snapshot.data!;
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              title: Text(
                data.name,
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
                },
              ),
              actions: [
                PopupMenuButton(
                  itemBuilder: (context) => [
                    const PopupMenuItem<int>(
                      value: 0,
                      child: Text("Edit",
                          style: TextStyle(color: Color(0xff534341))),
                    ),
                    const PopupMenuItem<int>(
                      value: 1,
                      child: Text("Wipe Data",
                          style: TextStyle(color: Color(0xff534341))),
                    ),
                    const PopupMenuItem<int>(
                      value: 2,
                      child: Text("Delete",
                          style: TextStyle(color: Color(0xff534341))),
                    ),
                  ],
                  onSelected: (item) => selecteditem(context, item),
                )
              ],
            ),
            body: RefreshIndicator(
              triggerMode: RefreshIndicatorTriggerMode.anywhere,
              onRefresh: () => Future.sync(
                  () => setState(() => {station = getStation(widget.id)})),
              child: Stack(
                children: [
                  ListView(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: StationDetailCard(
                            data: data,
                          ))
                    ],
                  ),
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }

  selecteditem(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.pushNamed(context, "/edit");
        break;
      case 1:
        //Metodo para apagar os dados da estaçao
        break;
      case 2:
        //Metodo para apagar a estação
        break;
      default:
    }
  }
}
