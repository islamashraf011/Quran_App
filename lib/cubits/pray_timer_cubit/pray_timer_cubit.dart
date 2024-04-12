import 'dart:async';
import 'package:adhan/adhan.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quran_app/services/change_duration_format.dart';
part 'pray_timer_state.dart';

class PrayTimerCubit extends Cubit<PrayTimerState> {
  PrayTimerCubit() : super(PrayTimerInitial());

  late Timer timer;
  String formattedTime = "";

  List<String> prayerNames = [
    "موعد صلاة الفجر: ",
    "موعد صلاة الظهر: ",
    "موعد صلاة العصر: ",
    "موعد صلاة المغرب: ",
    "موعد صلاة العشاء: ",
  ];

  void startCountDown() {
    List<DateTime> listofPrayTime = getCurrentPrayerTime();

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

  getCurrentPrayerTime() {
    final myCoordinates = Coordinates(30.033333, 31.233334);
    final params = CalculationMethod.karachi.getParameters();
    final date = DateComponents.from(DateTime.now());
    final prayertimesss = PrayerTimes(
      myCoordinates,
      date,
      params,
    );
    List<DateTime> prayer = [
      prayertimesss.fajr,
      prayertimesss.dhuhr,
      prayertimesss.asr,
      prayertimesss.maghrib,
      prayertimesss.isha,
    ];
    return prayer;
  }
}
