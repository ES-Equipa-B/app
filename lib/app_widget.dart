import 'dart:async';
import 'dart:convert';
import 'dart:math';


import 'package:app_sys_eng/screens/main_screen.dart';
import 'package:app_sys_eng/screens/settings_screen.dart';
import 'package:app_sys_eng/screens/splash_screen.dart';
import 'package:app_sys_eng/screens/new_station_screen.dart';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:telephony/telephony.dart';

import 'api/fetch_stations.dart';
import 'models/station_card_data.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final StreamController listenController = StreamController();
  late Stream<List<StationCardData>> stationsStream;

  int lastId = 0;

  _AppWidgetState() {
    stationsStream = listenController.stream.asyncMap((event) => synchronize());
  }

  Future<void> processSms(
      SmsMessage sms, List<StationCardData> stations) async {
    if (sms.address == null || sms.body == null) {
      return;

    
    }

    final address = sms.address!;
    final body = sms.body!;
    //if (body.length != 14) return;

    final station = stations.singleWhere((element) => element.phone == address);

  DateTime inferDate(int hour, int minute) {
  final now = DateTime.now();
  final date = DateTime(now.year, now.month, now.day, hour, minute);

  if (now.difference(date).isNegative) {
    final oneDayBefore = now.subtract(const Duration(days: 1));
    return DateTime(
        oneDayBefore.year, oneDayBefore.month, oneDayBefore.day, hour, minute);
  }

  return date;
}
    // HHmmWWWWHHHTTT, com: HH:mm, WWW.W, HHH, TT.T
    final timestamp = inferDate(int.parse(body.substring(0, 2)), int.parse(body.substring(2, 4)));
    final data = {
      "wind": double.parse(body.substring(4, 8)) / 10.0,
      "humidity": double.parse(body.substring(8, 11)),
      "temperature": double.parse(body.substring(11, 14)) / 10.0,
      "timestamp": DateTime.now().toIso8601String()
    };

    var jsonData = json.encode(data);
    print(jsonData);
    /*final response = await http.post(
        Uri.parse(
            "http://campheimdall.ddns.net:5000/stations/${station.id}/readings"),
        body: jsonData);*/
  }

  Future<List<StationCardData>> synchronize() async {
    final stations = await fetchStations();
    if (stations.isEmpty) {
      return stations;
    }
    var filter = SmsFilter.where(SmsColumn.ADDRESS).equals(stations[0].phone);
    var isFirst = true;
    for (var station in stations) {
      if (isFirst) {
        isFirst = false;
        continue;
      }
      filter = filter.or(SmsColumn.ADDRESS).equals(station.phone);
    }
    final inbox = await Telephony.instance.getInboxSms(
        filter: filter.and(SmsColumn.ID).greaterThan(lastId.toString()),
        sortOrder: [OrderBy(SmsColumn.ID, sort: Sort.ASC)]);
    for (var sms in inbox) {
      lastId = max(lastId, sms.id ?? 0);
      await processSms(sms, stations);
    }
    return await fetchStations();
  }

  @override
  void initState() {
    super.initState();

    Telephony.instance.listenIncomingSms(
        onNewMessage: (message) => listenController.add(null),
       listenInBackground: false);

    listenController.add(null);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => const SplashScreenState(),
        "/main": (context) => MainScreen(stationsStream, () => listenController.add(null)),
        "/newstation": (context) => const NewStationScreen(),
        "/settings": (context) => const SettingsScreen(),
      },
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red),
      ),
    );
  }
}
