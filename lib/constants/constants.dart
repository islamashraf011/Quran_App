import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const String kHomeImage = "assets/images/mosque home view.jpg";
const String kCompassImage = "assets/images/compass.png";
const String kNeedleImage = "assets/images/needle.png";
const String kMeccahImage = "assets/images/Mecca.png";

const Color kPrimaryColor = Color(0xff15a78e);
const Color kCardColorOne = Color(0xff13a088);
const Color kCardColorTwo = Color(0xffe78b5e);
const Color kCardColorThree = Color(0xff1a84ad);
const Color kCardColorFour = Color(0xffb05ee7);

const Color kAzkarColor = Color(0xffffd143);

//Const to Represent Data of Azkar from Json Files

const String kAzkarSabah = "assets/jsons/azkar/azkar_sabah.json";
const String kAzkarMassa = "assets/jsons/azkar/azkar_massa.json";
const String kAzkarAfterPray = "assets/jsons/azkar/azkar_after_pray.json";
const String kAzkarBeforeSleeping =
    "assets/jsons/azkar/azkar_before_sleep.json";
const String kAzkarHearingAzan = "assets/jsons/azkar/azkar_hear_azan.json";
const String kAzkarHome = "assets/jsons/azkar/azkar_home.json";
const String kAzkarinPraying = "assets/jsons/azkar/azkar_in_praying.json";
const String kAzkarMecca = "assets/jsons/azkar/azkar_mecca.json";
const String kAzkarWakingUp = "assets/jsons/azkar/azkar_wake_up.json";
const String kAzkarWashing = "assets/jsons/azkar/azkar_washing.json";

const List<String> namesofAzkar = [
  "أذكـــار الصبـــاح",
  "أذكـــار المســـاء",
  "أذكـــار بعد الصــلاة",
  "أذكـــار النــوم",
  "أذكـــار الاستيقاظ",
  "أذكـــار أثناء الصـلاة",
  "أذكـــار الآذان",
  "أذكـــار الوضـوء",
  "أذكـــار المنزل",
  "أذكــار الحـج والعمـرة",
];

const List<IconData> icon = [
  Icons.wb_sunny_outlined,
  FontAwesomeIcons.moon,
  FontAwesomeIcons.checkDouble,
  Icons.night_shelter_outlined,
  Icons.alarm,
  FontAwesomeIcons.personPraying,
  Icons.mosque_outlined,
  Icons.wash_outlined,
  Icons.home_outlined,
  FontAwesomeIcons.handsPraying
];

const List<String> azkarjsonfiles = [
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

//Const to Represent Data of Prayers from Json Files
const List<String> namesofPrayers = [
  "الـرُّقيـة الشـرعـية",
  "أدعية النَّبِيِّ صَلَّى اللهُ عَلَيْهِ وَسَلَّمَ",
  "أدعيــة الأنبياء",
  "أدعيــة للمتوفي",
  "الأدعيــة القرآنية",
  "أدعيــة متنوعـة",
  "دعــاء ختم القرآن الكريـم",
];

const String kRoqiaaSharaaya = "assets/jsons/prayers/roqiaa_sharaaya.json";
const String kPrayerRasol = "assets/jsons/prayers/prayer_rasol.json";
const String kPrayerAnbiaa = "assets/jsons/prayers/prayer_anbiaa.json";
const String kPrayerforDeath = "assets/jsons/prayers/prayer_for_death.json";
const String kPrayerQuran = "assets/jsons/prayers/prayer_quran.json";
const String kPrayerRandom = "assets/jsons/prayers/prayer_random.json";
const String kPrayerQuranSeal = "assets/jsons/prayers/prayer_quran_seal.json";

const List<String> prayersjsonfiles = [
  kRoqiaaSharaaya,
  kPrayerRasol,
  kPrayerAnbiaa,
  kPrayerforDeath,
  kPrayerQuran,
  kPrayerRandom,
  kPrayerQuranSeal
];
