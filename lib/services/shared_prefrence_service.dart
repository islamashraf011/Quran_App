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
