// import 'package:quran_app/cubits/pray_timer_cubit/pray_timer_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:quran_app/services/flutter_local_notification_service.dart';
import 'package:workmanager/workmanager.dart';
import '../cubits/pray_timer_cubit/pray_timer_cubit.dart';

class WorkManagerService {
  // 3- Register My Task with Unique Name to control function with it.

  Future<void> registerMyTasks() async {
    try {
      await Workmanager().registerPeriodicTask(
        "1",
        'showAzanNotification',
        frequency: const Duration(
          minutes: 20,
        ),
      );
      await Workmanager().registerPeriodicTask(
        "2",
        'showAzkarNotification',
        frequency: const Duration(
          hours: 12,
        ),
      );
    } catch (e) {
      debugPrint(
        'Exception occurred: ${e.toString()}',
      );
    }
  }

  // 1- Work Manager Initialization.
  // And Call this function when i need to Start this Service.

  Future<void> init() async {
    try {
      await Workmanager().initialize(
        backgroundActionTask,
        isInDebugMode: false,
      );

      registerMyTasks();
    } catch (e) {
      debugPrint(
        'Exception occurred: ${e.toString()}',
      );
    }
  }
}

// 2- Method that work in Background. and it should put it out the class
//this part called : Call Back Dispatcher
@pragma('vm:entry-point')
void backgroundActionTask() {
  try {
    Workmanager().executeTask(
      (taskName, inputData) async {
        if (taskName == 'showAzanNotification') {
          // To Show Azan Notification

          PrayTimerCubit().startCountDown();
        } else if (taskName == 'showAzkarNotification') {
          // To Show Azkar Notification

          await LocalNotificationService.showPeriodicNotification();
        }
        return Future.value(true);
      },
    );
  } catch (e) {
    debugPrint(
      'Exception occurred: ${e.toString()}',
    );
  }
}
