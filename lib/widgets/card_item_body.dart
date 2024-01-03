import 'package:flutter/material.dart';

class CardItemBody extends StatelessWidget {
  const CardItemBody({
    super.key,
    required this.icon,
    required this.title,
    required this.cardColor,
    required this.onTap,
  });
  final IconData icon;
  final String title;
  final Color cardColor;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.13,
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: cardColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: MediaQuery.of(context).size.height * 0.05,
              color: Colors.white,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.028,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
