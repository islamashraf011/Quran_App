import 'package:quran_app/helper/get_azkar_from_json_file.dart';
import 'package:quran_app/models/azkar_model.dart';

class AzkarSevice {
  List<AzkarModel> allData = [];
  Future<List<AzkarModel>> getAzkarData(String jsonFile) async {
    var data = await Azkar().getAzkar(jsonFile);

    // Make loop to get all Azkar in Json File & add it in List

    for (int i = 0; i < data.length; i++) {
      allData.add(
        AzkarModel.fromJson(data[i]),
      );
    }
    return allData;
  }
}
