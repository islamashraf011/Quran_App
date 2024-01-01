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
