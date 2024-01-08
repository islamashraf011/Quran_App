import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pray_timer_state.dart';

class PrayTimerCubit extends Cubit<PrayTimerState> {
  PrayTimerCubit() : super(PrayTimerInitial());
}
