import 'package:flutter/material.dart';

class CustomRowMenuItem extends StatelessWidget {
  const CustomRowMenuItem({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.width * 0.055,
          ),
        ),
        Icon(
          icon,
        ),
      ],
    );
  }
}
