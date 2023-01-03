import 'dart:async';
import 'dart:developer' as developer;

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:app_sys_eng/api/readings_api_provider.dart';
import 'package:app_sys_eng/api/station_api_provider.dart';
import 'package:app_sys_eng/models/reading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telephony/telephony.dart';

import 'models/station.dart';

class SMSService {
  static final ReadingsApiProvider _readingsProvider = ReadingsApiProvider();

  static Future<bool> enable() async {
    await Telephony.instance.requestSmsPermissions;
    developer.log("SMS Service enabled", name: "es:SMSService");
    return AndroidAlarmManager.periodic(
        const Duration(minutes: 1), 0, periodicTask,
        allowWhileIdle: true,
        exact: true,
        rescheduleOnReboot: true,
        wakeup: true,
        startAt: DateTime.now());
  }

  static Future<bool> disable() {
    developer.log("SMS Service disabled", name: "es:SMSService");
    return AndroidAlarmManager.cancel(0);
  }

  @pragma('vm:entry-point')
  static periodicTask() async {
    final DateTime now = DateTime.now();
    developer.log("$now: Running SMS Service", name: "es:SMSService");

    var stations = (await StationApiProvider().fetchAllStations()).stations;

    var pref = await SharedPreferences.getInstance();
    for (var station in stations) {
      developer.log("Checking ${station.phone}", name: "es:SMSService");
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
      // developer.log("Readings: $readings", name: "es:SMSService");
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
