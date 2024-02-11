class AzkarModel {
  final String zekr;
  final String? repeat;
  final String? bless;

  AzkarModel({
    required this.zekr,
    required this.repeat,
    required this.bless,
  });

  factory AzkarModel.fromJson(json) {
    return AzkarModel(
      zekr: json["zekr"],
      repeat: json["repeat"],
      bless: json["bless"],
    );
  }
}
