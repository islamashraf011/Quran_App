import 'package:flutter/material.dart';
import 'package:quran_app/constants/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.buttonColor,
    required this.title,
    required this.onTap,
    this.fontcolor = Colors.white,
    this.icon,
    this.fontSize,
    this.height,
    this.width,
    this.iconSize,
    this.iconColor,
  });
  final Color? buttonColor;
  final String title;
  final void Function() onTap;
  final Color fontcolor;
  final double? fontSize;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? MediaQuery.of(context).size.height * 0.05,
        width: width ?? MediaQuery.of(context).size.width * 0.41,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize:
                    fontSize ?? MediaQuery.of(context).size.height * 0.023,
                color: fontcolor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.02,
            ),
            //to remove space of icon if i don't use any icon
            if (icon != null)
              Icon(
                icon,
                textDirection: TextDirection.rtl,
                color: iconColor ?? kPrimaryColor,
                size: iconSize,
              ),
          ],
        ),
      ),
    );
  }
}
