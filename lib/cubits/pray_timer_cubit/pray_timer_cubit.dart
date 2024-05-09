import 'dart:async';
import 'package:adhan/adhan.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/services/change_duration_format.dart';
import 'package:quran_app/services/flutter_local_notification_service.dart';
import '../../constants/constants.dart';
import '../../services/shared_prefrence_service.dart';
import '../../widgets/qiblah/check_location_permission_method.dart';
part 'pray_timer_state.dart';

class PrayTimerCubit extends Cubit<PrayTimerState> {
  PrayTimerCubit() : super(PrayTimerInitial()) {
    getCurrentPrayerTime();
  }

  Timer? timer;
  String formattedTime = "";
  List<DateTime> listofPrayTime = [];

//Responsible for Calculating the difference between time now and the next prayer time then Starting The Count Down

  void startCountDown() async {
    try {
      await getCurrentPrayerTime();

      timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          var currentTime = DateTime.now();
          Duration? difference;
          DateTime? nextPrayerTime;
          int currentIndex = 0;

          // Check if it's 12:00 AM (midnight)
          if (currentTime.hour == 0 &&
              currentTime.minute == 0 &&
              currentTime.second == 0) {
            currentIndex = 0;
            // Reset the list of prayer times for the next day
            getCurrentPrayerTime().then((value) {
              startCountDown();
            });
          } else {
            for (int i = 0; i < listofPrayTime.length; i++) {
              if (currentTime.isBefore(listofPrayTime[i])) {
                nextPrayerTime = listofPrayTime[i];
                difference = currentTime.difference(nextPrayerTime);
                formattedTime = formatDuration(difference.abs());
                currentIndex = i;
                break;
              }
            }
          }
          emit(
            PrayTimerLoading(
              formattedTime,
              listPrayerName[currentIndex],
              listofPrayTime[currentIndex],
            ),
          );
          LocalNotificationService.showNotifications(
            listofPrayTime,
            currentIndex,
          );
        },
      );
    } catch (e) {
      emit(
        ErrorPrayTimerState(
          errorMsg: e.toString(),
        ),
      );
    }
  }

//Responsible for getting the Times of Prayer by the Current Location then Return list of Date Time

  Future<void> getCurrentPrayerTime() async {
    try {
      Map<String, double> location = await SaveLocationInfo().loadLongLat();
      double latitude = location['latitude'] ?? 0.0;
      double longitude = location['longitude'] ?? 0.0;
      final myCoordinates = Coordinates(latitude, longitude);
      final params = CalculationMethod.karachi.getParameters();
      final date = DateComponents.from(DateTime.now());
      final prayertimesss = PrayerTimes(
        myCoordinates,
        date,
        params,
      );
      listofPrayTime.clear();
      emit(PrayTimerSuccessful());

      listofPrayTime.addAll(
        [
          prayertimesss.fajr,
          prayertimesss.dhuhr,
          prayertimesss.asr,
          prayertimesss.maghrib,
          prayertimesss.isha,
        ],
      );

      emit(PrayTimerSuccessful());
    } catch (e) {
      emit(
        ErrorPrayTimerState(
          errorMsg: e.toString(),
        ),
      );
    }
  }

//Responsible for Saving the Latitude and Longitude of Current Location by shared preference

  Future<void> addPrayerTimes(BuildContext context) async {
    try {
      emit(PrayTimerload());

      Map<String, dynamic> locationinfo =
          await getCurrentLocationofDevice(context);
      double latitude = locationinfo['latitude'];
      double longitude = locationinfo['longitude'];

      await SaveLocationInfo().saveLongLat(latitude, longitude);
      await getCurrentPrayerTime();
      emit(PrayTimerSuccessful());
    } catch (e) {
      emit(
        ErrorPrayTimerState(
          errorMsg: e.toString(),
        ),
      );
    }
  }
}
