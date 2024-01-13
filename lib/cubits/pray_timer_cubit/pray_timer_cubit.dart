import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quran_app/services/change_duration_format.dart';
part 'pray_timer_state.dart';

class PrayTimerCubit extends Cubit<PrayTimerState> {
  PrayTimerCubit() : super(PrayTimerInitial());
  late Timer timer;
  String formattedTime = "";
  List<DateTime> listofPrayTime = [
    DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      5,
      20,
      0,
    ),
    DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      12,
      2,
      0,
    ),
    DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      14,
      53,
      0,
    ),
    DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      17,
      13,
      0,
    ),
    DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      18,
      35,
      0,
    ),
  ];
  List<String> prayerNames = [
    "موعد صلاة الفجر: ",
    "موعد صلاة الظهر: ",
    "موعد صلاة العصر: ",
    "موعد صلاة المغرب: ",
    "موعد صلاة العشاء: ",
  ];

  void startCountDown() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        var currentTime = DateTime.now();
        Duration? difference;
        DateTime nextPrayerTime;
        int currentIndex = 0;

        for (int i = 0; i < listofPrayTime.length; i++) {
          if (currentTime.isBefore(listofPrayTime[i])) {
            nextPrayerTime = listofPrayTime[i];
            difference = currentTime.difference(nextPrayerTime);
            formattedTime = formatDuration(difference.abs());
            currentIndex = i;
            print("todayIndex = $nextPrayerTime");
            break;
          }
        }
        emit(
          PrayTimerLoading(
            formattedTime,
            prayerNames[currentIndex],
            listofPrayTime[currentIndex],
          ),
        );
      },
    );
  }
}

