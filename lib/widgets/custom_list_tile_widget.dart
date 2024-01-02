import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    required this.title,
    required this.fontSize,
    this.color,
  });
  final String title;
  final double fontSize;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textDirection: TextDirection.rtl,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}

class CustomListTileWidget extends StatelessWidget {
  const CustomListTileWidget({
    super.key,
    required this.title,
    required this.titleSize,
    required this.subTitle,
    required this.subTitleSize,
    this.textAlign,
  });
  final String title;
  final String subTitle;
  final double titleSize;
  final double subTitleSize;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      title: Text(
        title,
        textDirection: TextDirection.rtl,
        style: TextStyle(
          fontSize: titleSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        subTitle,
        textDirection: TextDirection.rtl,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: subTitleSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
