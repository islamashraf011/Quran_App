import 'package:flutter/material.dart';

class EditPrayerTime extends StatelessWidget {
  const EditPrayerTime({super.key});
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
          ),
        ),
      ),
    );
  }
}
