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
    if (body.length != 140) return;

    final station = stations.singleWhere((element) => element.phone == address);

  DateTime inferDate(sms, int hour, int minute) {
  final now = DateTime.fromMillisecondsSinceEpoch(sms.dateSent ?? 0);
  final date = DateTime(now.year, now.month, now.day, hour, minute);

  if (now.difference(date).isNegative) {
    final oneDayBefore = now.subtract(const Duration(days: 1));
    return DateTime(
        oneDayBefore.year, oneDayBefore.month, oneDayBefore.day, hour, minute);
  }

  return date;
}
    // HHmmWWWWHHHTTT, com: HH:mm, WWW.W, HHH, TT.T
    int j = 0;
    for(int i = 0; i < 10; i++)
    {
    final timestamp = inferDate( sms , int.parse(body.substring(j+0, j+2)), int.parse(body.substring(j+2, j+4)));
    final data = {
      "wind": double.parse(body.substring(j+4, j+8)) / 10.0,
      "humidity": double.parse(body.substring(j+8, j+11)),
      "temperature": double.parse(body.substring(j+11, j+14)) / 10.0,
      "timestamp": timestamp.toIso8601String()
    };

    var jsonData = json.encode(data);
    
    print(jsonData);
    
    j += 14;
    /*final response = await http.post(
        Uri.parse(
            "http://campheimdall.ddns.net:5000/stations/${station.id}/readings"),
        body: jsonData);*/
    }
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
        sortOrder: [OrderBy(SmsColumn.ID, sort: Sort.ASC)], columns: [ SmsColumn.ID, SmsColumn.ADDRESS, SmsColumn.BODY, SmsColumn.DATE, SmsColumn.DATE_SENT ]);
    for (var sms in inbox) {
      if((sms.id ?? 0) > lastId) await processSms(sms, stations);
      lastId = max(lastId, sms.id ?? 0);
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
