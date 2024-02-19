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
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Icon(
          icon,
        ),
      ],
    );
  }
}
