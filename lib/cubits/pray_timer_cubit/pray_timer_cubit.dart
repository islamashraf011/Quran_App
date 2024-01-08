import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../services/change_duration_format.dart';
part 'pray_timer_state.dart';

class PrayTimerCubit extends Cubit<PrayTimerState> {
  PrayTimerCubit() : super(PrayTimerInitial());
  late Timer timer;
  String formattedTime = "";
  var currentTime = DateTime.now();
  List<DateTime> prayTime = [];

  void startCountDown() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        formattedTime = "00:00:00";
        for (int i = 0; i < prayTime.length; i++) {
          var difference = prayTime[i].difference(currentTime);
          if (difference > Duration.zero) {
            emit(
              PrayTimerLoading(
                formattedTime = formatDuration(difference),
              ),
            );
          } else if (difference == Duration.zero) {
            emit(
              PrayTimerSuccessful(),
            );
            Timer(
              const Duration(seconds: 15),
              () {
                i++;
                if (i >= prayTime.length) {
                  i == 0;
                }
              },
            );
          } else {
            emit(
              PrayTimerFailure("يوجد مشكلة برجاء الاستخدام في وقت اخر"),
            );
          }
        }
      },
    );
  }

  void addPrayerTime(int hour, int minute, int? sec) {
    final prayerTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      hour,
      minute,
      sec = 0,
    );
    prayTime.add(prayerTime);
  }
}
