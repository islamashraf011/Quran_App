import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:quran_app/constants/constants.dart';
import 'package:quran_app/models/azkar_model.dart';
import 'package:quran_app/services/get_azkar_service.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static onTap(NotificationResponse notificationResponse) {}

  static Future init() async {
    try {
      tz.initializeTimeZones();

      const InitializationSettings initializationSettings =
          InitializationSettings(
        android: AndroidInitializationSettings('ic_launcher_foreground'),
        iOS: DarwinInitializationSettings(),
      );

      await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: onTap,
        onDidReceiveBackgroundNotificationResponse: onTap,
      );
    } catch (e) {
      debugPrint(
        'Exception occurred: ${e.toString()}',
      );
    }
  }

// Responsible for Showing Schedule Notifications (Azan For Prayer Times)
  static void showNotifications(
      List<DateTime> prayerTimes, int currentIndex) async {
    try {
      NotificationDetails notificationDetails =
          getNotificationDetails('azan', 'channel1', 'AzanChannel');

      final String timeZoneName = tz.local.name;
      final DateTime scheduledTime = prayerTimes[currentIndex];

      // Convert the PrayerTime To TZ DateTime.
      final tz.TZDateTime tZNotificationTime = tz.TZDateTime.from(
        scheduledTime,
        tz.getLocation(timeZoneName),
      );

      //Handle Schedule Notifications Details.
      if (scheduledTime.isBefore(DateTime.now())) {
        await Future.delayed(
          const Duration(days: 1),
        );
      }
      await flutterLocalNotificationsPlugin.zonedSchedule(
        currentIndex,
        "الآذان",
        "حــان الآن ${notificationPrayerName[currentIndex]}🌸",
        tZNotificationTime,
        notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );
    } catch (e) {
      debugPrint(
        'Exception occurred: ${e.toString()}',
      );
    }
  }

// Responsible to show Zekr Notification Every Day
  static Future<void> showPeriodicNotification() async {
    try {
      final NotificationDetails notificationDetails =
          getNotificationDetails(null, 'channel2', 'AzkarChannel');
      List<AzkarModel> azkar = await AzkarSevice().getAzkarData(kPrayerQuran);
      int randomIndex = Random().nextInt(azkar.length - 1);
      await flutterLocalNotificationsPlugin.show(
        randomIndex,
        "أذكــار يـومـيـة🌹",
        '${azkar[randomIndex].zekr}🌸',
        notificationDetails,
      );
    } catch (e) {
      debugPrint(
        'Exception occurred: ${e.toString()}',
      );
    }
  }

//Responsible for Getting Notification Details (sound,icon,color..)
  static NotificationDetails getNotificationDetails(
      String? soundPath, String channelId, String channelName) {
    AndroidNotificationDetails details = AndroidNotificationDetails(
      channelId,
      channelName,
      priority: Priority.high,
      importance: Importance.max,
      playSound: true,
      icon: 'ic_launcher_foreground',
      color: kAzkarColor,
      enableVibration: false,
      styleInformation: const BigTextStyleInformation(''),
      sound: soundPath != null
          ? RawResourceAndroidNotificationSound(soundPath)
          : null,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: details,
    );
    return notificationDetails;
  }

  //Responsible for Getting Permission from User to Show Notification.
  static Future getPermission() async {
    try {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();
    } catch (e) {
      debugPrint(
        'Exception occurred: ${e.toString()}',
      );
    }
  }

  //Responsible for Cancel Notification Service.

  static Future cancelNotification() async {
    try {
      await flutterLocalNotificationsPlugin.cancelAll();
    } catch (e) {
      debugPrint(
        'Exception occurred: ${e.toString()}',
      );
    }
  }
}
