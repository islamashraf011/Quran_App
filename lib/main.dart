import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/cubits/pray_timer_cubit/pray_timer_cubit.dart';
import 'package:quran_app/views/azkar_view.dart';
import 'package:quran_app/views/home_view.dart';
import 'package:quran_app/views/edit_prayer_time_view.dart';
import 'package:quran_app/views/prayer_view.dart';
import 'package:quran_app/views/qiblah_view.dart';
import 'package:quran_app/views/quran_listening_view.dart';
import 'package:quran_app/views/quran_reading_view.dart';

void main() {
  runApp(const QuranApp());
}

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PrayTimerCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          dividerTheme: DividerThemeData(
            color: Colors.white.withOpacity(0.5),
          ),
        ),
        initialRoute: HomeView.id,
        routes: {
          HomeView.id: (context) => const HomeView(),
          EditPrayerTimeView.id: (context) => const EditPrayerTimeView(),
          QiblahView.id: (context) => const QiblahView(),
          AzkarView.id: (context) => const AzkarView(),
          PrayerView.id: (context) => const PrayerView(),
          QuranReadingView.id: (context) => const QuranReadingView(),
          QuranListeningView.id: (context) => const QuranListeningView(),
        },
      ),
    );
  }
}
