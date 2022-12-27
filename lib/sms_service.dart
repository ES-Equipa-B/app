import 'dart:async';
import 'dart:developer' as developer;

import 'package:app_sys_eng/api/readings_api_provider.dart';
import 'package:app_sys_eng/blocs/station_list_bloc.dart';
import 'package:app_sys_eng/models/reading.dart';
import 'package:app_sys_eng/models/station_list.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telephony/telephony.dart';

import 'models/station.dart';

class SMSService {
  static Timer? _timer;
  static StationList? _stationList;
  static final ReadingsApiProvider _readingsProvider = ReadingsApiProvider();

  static Future<bool> initialize() {
    const androidConfig = FlutterBackgroundAndroidConfig(
      notificationTitle: "Weather Station SMS Service",
      notificationText:
          "Background notification for keeping the weather station app running in the background",
      notificationImportance: AndroidNotificationImportance.Default,
      notificationIcon:
          AndroidResource(name: 'background_icon', defType: 'drawable'),
      enableWifiLock: true,
    );

    stationListBloc.allStations.listen((value) {
      _stationList = value;
    });

    return FlutterBackground.initialize(androidConfig: androidConfig);
  }

  static Future<bool> enable() {
    return FlutterBackground.enableBackgroundExecution().then((value) {
      _timer =
          Timer.periodic(const Duration(seconds: 5), (timer) => periodicTask());
      return true;
    });
  }

  static Future<bool> disable() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    return FlutterBackground.disableBackgroundExecution();
  }

  static periodicTask() async {
    developer.log("Running SMS Service", name: "es:SMSService");

    if (_stationList == null) {
      developer.log("Station List is loading, skiping...",
          name: "es:SMSService");
      return;
    }

    var stations = _stationList!.stations;

    var pref = await SharedPreferences.getInstance();
    for (var station in stations) {
      // developer.log("Checking ${station.phone}", name: "es:SMSService");
      String key = "station.${station.phone}";
      var inbox = await getUnprocessedSMS(station, pref.getInt(key) ?? 0);
      // developer.log("Last SMS: ${pref.getInt(key)}", name: "es:SMSService");
      if (inbox.isNotEmpty) {
        developer.log("Station ${station.id} has ${inbox.length} new messages",
            name: "es:SMSService");
        for (var message in inbox) {
          if (message.id != null && message.body != null) {
            var success = processSMS(station, message);
            developer.log("Message: ${message.body}",
                name: "es:SMSService",
                error: !success ? "Message rejected" : null);
            pref.setInt(key, message.id!);
          }
        }
      }
    }
  }

  // HHmmWWW.WHHH(0/1)TT.T
  // HHmmWWWWHHH0TTT - 15 caracteres
  static bool processSMS(Station station, SmsMessage message) {
    String body = message.body!;
    DateTime sent = DateTime.fromMillisecondsSinceEpoch(message.dateSent!);
    int charsPerSample = 15;
    int samplesPerMessage = 10;

    if (body.length != charsPerSample * samplesPerMessage) {
      return false;
    }

    try {
      List<Reading> readings = List<Reading>.generate(samplesPerMessage, (i) {
        String sample =
            body.substring(i * charsPerSample, (i + 1) * charsPerSample);
        Reading reading = Reading.fromString(sample, sent);
        return reading;
      });
      developer.log("Readings: $readings", name: "es:SMSService");
      _readingsProvider.insertReadings(station.id, readings);
      return true;
    } catch (e) {
      developer.log("", error: "Invalid SMS, $e", name: "es:SMSService");
      return false;
    }
  }

  static Future<List<SmsMessage>> getUnprocessedSMS(
      Station station, int lastId) {
    int epoch = 0;
    if (station.reading.timeStamp != null) {
      epoch = station.reading.timeStamp!.millisecondsSinceEpoch;
    }
    var filter = SmsFilter.where(SmsColumn.ADDRESS)
        .equals(station.phone)
        .and(SmsColumn.DATE_SENT)
        .greaterThan(epoch.toString())
        .and(SmsColumn.ID)
        .greaterThan(lastId.toString());

    return Telephony.instance.getInboxSms(filter: filter, columns: [
      SmsColumn.ID,
      SmsColumn.ADDRESS,
      SmsColumn.BODY,
      SmsColumn.DATE,
      SmsColumn.DATE_SENT
    ], sortOrder: [
      OrderBy(SmsColumn.ID, sort: Sort.ASC)
    ]);
  }
}
