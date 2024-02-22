import 'package:flutter/material.dart';

class QuranListeningView extends StatelessWidget {
  const QuranListeningView({super.key});
  static String id = "QuranListening";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "القائمـة الرئيسية",
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.08,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
