part of 'pray_timer_cubit.dart';

@immutable
abstract class PrayTimerState {}

final class PrayTimerInitial extends PrayTimerState {}

final class PrayTimerLoading extends PrayTimerState {}

final class PrayTimerSuccessful extends PrayTimerState {}

final class PrayTimerFailure extends PrayTimerState {
  final String errorMessage;

  PrayTimerFailure(this.errorMessage);
}
