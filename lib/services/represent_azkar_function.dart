import '../constants/constants.dart';
import 'navigation_to_reading_view.dart';

Future<void> representDataFunction(int index, context) async {
  if (index == 0) {
    await navigationToReadingView(
        context, kAzkarSabah, index, namesofAzkar[index]);
  }

  if (index == 1) {
    await navigationToReadingView(
        context, kAzkarMassa, index, namesofAzkar[index]);
  }
  if (index == 2) {
    await navigationToReadingView(
        context, kAzkarAfterPray, index, namesofAzkar[index]);
  }
  if (index == 3) {
    await navigationToReadingView(
        context, kAzkarBeforeSleeping, index, namesofAzkar[index]);
  }
  if (index == 4) {
    await navigationToReadingView(
        context, kAzkarWakingUp, index, namesofAzkar[index]);
  }
  if (index == 5) {
    await navigationToReadingView(
        context, kAzkarinPraying, index, namesofAzkar[index]);
  }
  if (index == 6) {
    await navigationToReadingView(
        context, kAzkarHearingAzan, index, namesofAzkar[index]);
  }
  if (index == 7) {
    await navigationToReadingView(
        context, kAzkarWashing, index, namesofAzkar[index]);
  }
  if (index == 8) {
    await navigationToReadingView(
        context, kAzkarHome, index, namesofAzkar[index]);
  }
  if (index == 9) {
    await navigationToReadingView(
        context, kAzkarMecca, index, namesofAzkar[index]);
  }
}
