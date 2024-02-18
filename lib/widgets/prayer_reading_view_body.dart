import 'package:flutter/material.dart';
import 'package:quran_app/constants/constants.dart';
import 'package:quran_app/services/navigation_to_reading_view.dart';
import 'package:quran_app/components/custom_listview_of_names.dart';

class PrayerReadingViewBody extends StatelessWidget {
  const PrayerReadingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomListViewofNames(
      itemCount: namesofPrayers.length,
      title: namesofPrayers,
      onTap: (index) {
        navigationToReadingView(
            context, prayersjsonfiles[index], index, namesofPrayers[index]);
      },
    );
  }
}
