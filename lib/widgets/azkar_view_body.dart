import 'package:flutter/material.dart';
import 'package:quran_app/constants/constants.dart';
import '../services/represent_azkar_function.dart';
import 'custom_listview_of_names.dart';

class AzkarViewBody extends StatelessWidget {
  const AzkarViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomListViewofNames(
      itemCount: namesofAzkar.length,
      title: namesofAzkar,
      iconData: icon,
      onTap: (index) {
        representDataFunction(index, context);
      },
    );
  }
}
