import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:app_sys_eng/app_widget.dart';
import 'package:app_sys_eng/sms_service.dart';
import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';

backgrounMessageHandler(SmsMessage message) async {
  SMSService.periodicTask();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();
  Telephony.instance.listenIncomingSms(
      onNewMessage: (SmsMessage message) {
        // SMSService.periodicTask();
      },
      onBackgroundMessage: backgrounMessageHandler);

  runApp(const AppWidget());
  // await AndroidAlarmManager.periodic(
  //     const Duration(minutes: 1), 0, SMSService.periodicTask,
  //     exact: true,
  //     allowWhileIdle: true,
  //     rescheduleOnReboot: true,
  //     wakeup: true);
}
