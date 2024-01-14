import 'package:flutter/material.dart';
import '../constants/constants.dart';

class EditTimeCard extends StatefulWidget {
  const EditTimeCard({
    super.key,
    required this.listPrayerName,
    required this.listPrayerTime,
    required this.index,
  });
  final List<String> listPrayerName;
  final List<DateTime> listPrayerTime;
  final int index;

  @override
  State<EditTimeCard> createState() => _EditTimeCardState();
}

class _EditTimeCardState extends State<EditTimeCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.03,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.withOpacity(0.07),
        ),
        child: ListTile(
            title: Text(
              textDirection: TextDirection.rtl,
              widget.listPrayerName[widget.index],
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.08,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
            subtitle: Text(
              textDirection: TextDirection.rtl,
              "الساعة: ${widget.listPrayerTime[widget.index].hour} ,     الدقيقة: ${widget.listPrayerTime[widget.index].minute}",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.04,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {}),
      ),
    );
  }
}
