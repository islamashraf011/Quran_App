import 'package:quran_app/constants/constants.dart';
import 'package:quran_app/helper/get_azkar_from_json_file.dart';
import 'package:quran_app/models/azkar_model.dart';

class AzkarSevice {
  List<AzkarModel> allData = [];
  Future<List<AzkarModel>> getAzkarData() async {
    const List<String> jsonFiles = [
      kAzkarSabah,
      kAzkarMassa,
      kAzkarAfterPray,
      kAzkarBeforeSleeping,
      kAzkarWakingUp,
      kAzkarinPraying,
      kAzkarHearingAzan,
      kAzkarWashing,
      kAzkarHome,
      kAzkarMecca,
    ];
    //Make Loop to get the Name of json File in this list
    for (String jsonFile in jsonFiles) {
      var data = await Azkar().getAzkar(jsonFile);

      //then Another Loop to get all Data in this json File.
      for (int i = 0; i < data.length; i++) {
        allData.add(
          AzkarModel.fromJson(data[i]),
        );
      }
    }
    return allData;
  }
}
