import 'package:flutter/material.dart';
import '../models/azkar_model.dart';
import '../views/azkar_reading_view.dart';
import 'get_azkar_service.dart';

Future<void> navigationToReadingView(
    context, String jsonFile, int index, String title) async {
  List<AzkarModel> azkarData = await AzkarSevice().getAzkarData(jsonFile);
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return AzkarReadingView(
          azkar: azkarData,
          title: title,
        );
      },
    ),
  );
}
