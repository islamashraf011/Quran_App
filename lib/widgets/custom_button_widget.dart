import 'package:flutter/material.dart';
import 'package:quran_app/constants/constants.dart';
import 'custom_list_tile_widget.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.buttonColor,
    required this.title,
    required this.fontSize,
    required this.onTap,
    this.fontcolor,
    this.icon,
  });
  final Color? buttonColor;
  final String title;
  final double fontSize;
  final void Function() onTap;
  final Color? fontcolor;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.width * 0.41,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextWidget(
              title: title,
              fontSize: fontSize,
              color: fontcolor,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).width * 0.05,
            ),
            if (icon != null)
              Icon(
                icon,
                color: kPrimaryColor,
              ),
          ],
        ),
      ),
    );
  }
}
