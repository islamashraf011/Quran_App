import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/pray_timer_cubit/pray_timer_cubit.dart';
import 'edit_time_card.dart';

class EditPrayerTimeBody extends StatelessWidget {
  const EditPrayerTimeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PrayTimerCubit cubit = BlocProvider.of<PrayTimerCubit>(context);
    List<DateTime> listPrayerTime = cubit.getCurrentPrayerTime();
    List<String> listPrayerName = cubit.prayerNames;

    return ListView.builder(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.03,
        horizontal: MediaQuery.of(context).size.height * 0.01,
      ),
      itemCount: listPrayerTime.length,
      itemBuilder: (context, index) {
        return EditTimeCard(
          index: index,
          listPrayerName: listPrayerName,
          listPrayerTime: listPrayerTime,
        );
      },
    );
  }
}
