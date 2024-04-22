part of 'pray_timer_cubit.dart';

@immutable
abstract class PrayTimerState {}

final class PrayTimerInitial extends PrayTimerState {}

final class PrayTimerLoading extends PrayTimerState {
  final String formatedPrayTime;
  final String nameofPray;
  final DateTime prayerTime;

  PrayTimerLoading(
    this.formatedPrayTime,
    this.nameofPray,
    this.prayerTime,
  );
}

final class PrayTimerSuccessful extends PrayTimerState {}

final class PrayTimerload extends PrayTimerState {}

final class ErrorPrayTimerState extends PrayTimerState {
  final String errorMsg;

  ErrorPrayTimerState({required this.errorMsg});
}
