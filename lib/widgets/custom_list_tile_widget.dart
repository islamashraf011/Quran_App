import 'package:flutter/material.dart';

class CustomListTileWidget extends StatelessWidget {
  const CustomListTileWidget({
    super.key,
    required this.title,
    required this.titleSize,
    required this.subTitle,
    required this.subTitleSize,
    this.subTitleAlign,
    this.time = "",
    this.timeColor,
  });
  final String title;
  final String subTitle;
  final double titleSize;
  final double subTitleSize;
  final String time;
  final Color? timeColor;
  final TextAlign? subTitleAlign;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            time,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: titleSize,
              fontWeight: FontWeight.bold,
              color: timeColor,
            ),
          ),
          Text(
            title,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: titleSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
      subtitle: Text(
        subTitle,
        textDirection: TextDirection.rtl,
        textAlign: subTitleAlign,
        style: TextStyle(
          fontSize: subTitleSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
