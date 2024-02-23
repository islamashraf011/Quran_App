import 'package:flutter/material.dart';

class CustomSurahButton extends StatelessWidget {
  const CustomSurahButton({
    super.key,
    required this.onTap,
    required this.numberSurah,
    required this.nameSurah,
  });
  final Function() onTap;
  final int numberSurah;
  final String nameSurah;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.09,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xfffefbec),
        ),
        child: Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.15,
              color: Colors.black,
              child: Center(
                child: Text(
                  "$numberSurah",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Text(
              nameSurah,
              style: TextStyle(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.width * 0.09,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.15,
              color: Colors.black,
              child: Center(
                child: Icon(
                  Icons.play_arrow,
                  size: MediaQuery.of(context).size.width * 0.08,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
