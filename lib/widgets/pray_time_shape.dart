import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'custom_button_widget.dart';
import 'custom_list_tile_widget.dart';

class CustomPrayTimeShape extends StatelessWidget {
  const CustomPrayTimeShape({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CustomListTileWidget(
            title: "موعد صلاة الظهر :",
            titleSize: MediaQuery.of(context).size.height * 0.025,
            time: " 12:20",
            timeColor: kPrimaryColor,
            subTitle: "02:23:14",
            subTitleSize: MediaQuery.of(context).size.height * 0.040,
            subTitleAlign: TextAlign.center,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                icon: Icons.explore,
                title: "القبلة",
                buttonColor: Colors.white,
                fontcolor: Colors.black,
                onTap: () {},
              ),
              CustomButton(
                title: "تعديل وقت الصلاة",
                buttonColor: kPrimaryColor,
                onTap: () {},
              )
            ],
          ),
        ],
      ),
    );
  }
}
