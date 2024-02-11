import 'package:flutter/material.dart';
import 'package:quran_app/models/azkar_model.dart';
import '../widgets/azkar_reading_view_body.dart';

class AzkarReadingView extends StatelessWidget {
  const AzkarReadingView({
    super.key,
    required this.azkar,
    required this.title,
  });
  final List<AzkarModel> azkar;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5e9c2),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xffd28e13),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width * 0.10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: AzkarReadingViewBody(
        azkar: azkar,
      ),
    );
  }
}
