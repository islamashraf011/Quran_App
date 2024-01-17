import 'package:flutter/material.dart';
import '../widgets/edit_prayer_time_body.dart';

class EditPrayerTimeView extends StatelessWidget {
  const EditPrayerTimeView({super.key});
  static String id = "EditPrayerTime";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "تعديل وقت الصلاة",
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const EditPrayerTimeBody(),
    );
  }
}
