import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:quran_app/cubits/pray_timer_cubit/pray_timer_cubit.dart';
import 'package:quran_app/views/edit_prayer_time_view.dart';
import 'package:quran_app/views/qiblah_view.dart';
import '../constants/constants.dart';
import '../components/custom_button_widget.dart';
import '../components/custom_list_tile_widget.dart';

class CustomPrayTimeShape extends StatelessWidget {
  const CustomPrayTimeShape({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PrayTimerCubit()..startCountDown(),
      child: BlocBuilder<PrayTimerCubit, PrayTimerState>(
        builder: (context, state) {
          String timertoNextPray = "";
          String prayerName = "";
          String prayerTime = "";
          if (state is PrayTimerLoading) {
            timertoNextPray = state.formatedPrayTime;
            prayerName = state.nameofPray;
            prayerTime = DateFormat("hh:mm").format(state.prayerTime);
          } else {
            timertoNextPray = "تعديل وقت الصلاة";
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                CustomListTileWidget(
                  title: prayerName,
                  titleSize: MediaQuery.of(context).size.height * 0.025,
                  time: prayerTime,
                  timeColor: kPrimaryColor,
                  subTitle: timertoNextPray,
                  subTitleSize: MediaQuery.of(context).size.height * 0.040,
                  subTitleAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.41,
                      icon: Icons.explore,
                      iconColor: kPrimaryColor,
                      title: "القبلة",
                      fontSize: MediaQuery.of(context).size.height * 0.023,
                      buttonColor: Colors.white,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          QiblahView.id,
                        );
                      },
                    ),
                    CustomButton(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.41,
                      title: "تعديل وقت الصلاة",
                      fontcolor: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.023,
                      buttonColor: kPrimaryColor,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          EditPrayerTimeView.id,
                        );
                      },
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
