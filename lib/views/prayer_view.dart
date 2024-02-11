import 'package:flutter/material.dart';
import 'package:quran_app/widgets/prayer_reading_view_body.dart';

class PrayerView extends StatelessWidget {
  const PrayerView({super.key});
  static String id = "PrayerView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5e9c2),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xffd28e13),
        title: Text(
          "الأدعيـــة",
          style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width * 0.10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const PrayerReadingViewBody(),
    );
  }
}
