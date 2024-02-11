import 'package:flutter/material.dart';
import '../widgets/azkar_view_body.dart';

class AzkarView extends StatelessWidget {
  const AzkarView({super.key});
  static String id = "AzkarView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5e9c2),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xffd28e13),
        title: Text(
          "الأذكــار",
          style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width * 0.10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const AzkarViewBody(),
    );
  }
}
