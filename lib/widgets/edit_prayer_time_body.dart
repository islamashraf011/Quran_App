import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/components/custom_button_widget.dart';
import 'package:quran_app/components/show_snack_bar.dart';
import 'package:quran_app/constants/constants.dart';
import 'package:quran_app/cubits/pray_timer_cubit/pray_timer_cubit.dart';
import 'package:restart_app/restart_app.dart';
import 'edit_time_card.dart';

class EditPrayerTimeBody extends StatelessWidget {
  const EditPrayerTimeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayTimerCubit, PrayTimerState>(
      builder: (context, state) {
        PrayTimerCubit cubit = BlocProvider.of<PrayTimerCubit>(context);
        List<DateTime> listPrayerTime = cubit.listofPrayTime;

        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.03,
            horizontal: MediaQuery.of(context).size.height * 0.01,
          ),
          child: Column(
            children: [
              CustomButton(
                title: "إضافة مواقيت الصلاة",
                buttonColor: kCardColorOne,
                icon: Icons.add,
                iconSize: MediaQuery.of(context).size.height * 0.04,
                onTap: () async {
                  await cubit.addPrayerTimes(context);
                  if (context.mounted) {
                    showSnackBar(
                      context,
                      'سيتم إعادة تشغيل التطبيق',
                    );
                  }
                  await Future.delayed(
                    const Duration(seconds: 2),
                  );
                  Restart.restartApp();
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              if (state is PrayTimerload)
                const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              if (state is PrayTimerSuccessful)
                Expanded(
                  child: ListView.builder(
                    itemCount: listPrayerTime.length,
                    itemBuilder: (context, index) {
                      return EditTimeCard(
                        index: index,
                        listPrayerName: listPrayerName,
                        listPrayerTime: listPrayerTime,
                      );
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
