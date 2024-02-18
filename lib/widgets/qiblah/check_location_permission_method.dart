import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../../components/show_snack_bar.dart';
import 'open_location_setting_dialog.dart';

Future<Position> getCurrentLocationofDevice(BuildContext context) async {
  bool serviceEnabled;
  LocationPermission permission;

  //Check if the Location Service Enabled or Not
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled && context.mounted) {
    await openLocationSettingDialog(context, serviceEnabled);
  }

  //then Check if the App take Permission to use Location or Not
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied && context.mounted) {
      showSnackBar(
        context,
        "الرجاء السماح للتطبيق الوصول للموقع الخاص بك",
      );
    }
  }
  if (permission == LocationPermission.deniedForever && context.mounted) {
    showSnackBar(
      context,
      "لا يمكنك استخدام الخدمه حتي السماح للتطبيق الوصول للموقع الخاص بك",
    );
  }

  //After check return the current location of device
  Position currentLocation = await Geolocator.getCurrentPosition();
  return currentLocation;
}
