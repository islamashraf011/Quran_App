import 'package:flutter/material.dart';
import 'package:quran_app/constants/constants.dart';
import 'package:quran_app/widgets/custom_button_widget.dart';

class AzkarViewBody extends StatelessWidget {
  const AzkarViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: names.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20,
          ),
          child: CustomButton(
            title: names[index],
            icon: icon[index],
            iconSize: MediaQuery.of(context).size.width * 0.12,
            onTap: () {},
          ),
        );
      },
    );
  }
}
