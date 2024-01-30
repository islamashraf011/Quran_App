import 'dart:convert';

import 'package:flutter/services.dart';

// Access Data from Json file and decode it.
class Azkar {
  Future<dynamic> getAzkar(String azkarPath) async {
    var response = await rootBundle.loadString(azkarPath);
    return jsonDecode(response);
  }
}
