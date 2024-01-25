import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

Future<dynamic> openLocationSettingDialog(
    BuildContext context, bool serviceEnabled) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        actionsAlignment: MainAxisAlignment.center,
        content: const Text(
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          "الرجاء تشغيل خدمة الموقع علي جهازك",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              //Make User go to Location Setting Automatic
              Geolocator.openLocationSettings();
              //Close the Dialog after open the Location Service
              if (serviceEnabled == false) {
                Navigator.pop(context);
              }
            },
            child: const Text(
              "فتح اعدادت الموقع",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
    },
  );
}
