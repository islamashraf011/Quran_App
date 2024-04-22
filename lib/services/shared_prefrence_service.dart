import 'package:shared_preferences/shared_preferences.dart';

class MarkedPage {
  Future<void> saveMarkedPageIndex(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("markedIndex", index);
  }

  Future<int> loadMarkedPageIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("markedIndex") ?? 0;
  }
}

class SaveLocationInfo {
  Future<void> saveLongLat(double latitude, double longitude) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('latitude', latitude);
    await prefs.setDouble('longitude', longitude);
  }

  Future<Map<String, double>> loadLongLat() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double latitude = prefs.getDouble('latitude') ?? 0.0;
    double longitude = prefs.getDouble('longitude') ?? 0.0;

    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
