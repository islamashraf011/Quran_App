import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'custom_button_widget.dart';
import 'custom_text_widget.dart';

class CustomPrayTimeShape extends StatelessWidget {
  const CustomPrayTimeShape({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomTextWidget(
              title: " 12:22",
              fontSize: MediaQuery.of(context).size.height * 0.028,
              color: kPrimaryColor,
            ),
            CustomTextWidget(
              title: "موعد صلاة الظهر :",
              fontSize: MediaQuery.of(context).size.height * 0.025,
            )
          ],
        ),
        Center(
          child: CustomTextWidget(
            title: "02:23:14",
            fontSize: MediaQuery.of(context).size.height * 0.040,
          ),
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
              fontSize: MediaQuery.of(context).size.height * 0.025,
              buttonColor: Colors.white,
              fontcolor: Colors.black,
              onTap: () {},
            ),
            CustomButton(
              title: "تعديل وقت الصلاة",
              fontSize: MediaQuery.of(context).size.height * 0.025,
              buttonColor: kPrimaryColor,
              onTap: () {},
            )
          ],
        ),
      ],
    );
  }
}
