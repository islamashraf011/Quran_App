import 'package:flutter/material.dart';
import '../widgets/quran_listening_view_body.dart';

class QuranListeningView extends StatelessWidget {
  const QuranListeningView({super.key});
  static String id = "QuranListening";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "القائمـة الرئيسية",
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.08,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const QuranListeningViewBody(),
    );
  }
}
