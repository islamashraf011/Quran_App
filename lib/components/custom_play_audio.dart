import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'custom_icon_button.dart';

class CustomPlayAudio extends StatelessWidget {
  const CustomPlayAudio({
    super.key,
    required this.index,
    required this.sliderMax,
    required this.audioRateValue,
    required this.skipPrevious,
    required this.playAudio,
    required this.skipNext,
  });
  final int index;
  final double sliderMax;
  final double audioRateValue;
  final Function() skipPrevious;
  final Function() playAudio;
  final Function() skipNext;

  @override
  Widget build(BuildContext context) {
    final String title = surahList[index];
    return Column(
      children: [
        Text(
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          "الشيخ ماهر المعيقلي .. سُوْرَةُ $title",
          style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.height * 0.040,
            fontWeight: FontWeight.bold,
          ),
        ),
        Image.asset(
          kMaher,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Slider(
          min: 0.0,
          max: sliderMax,
          thumbColor: Colors.white,
          value: audioRateValue,
          onChanged: (newRate) {},
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomIconButton(
              onPressed: skipPrevious,
              icon: Icons.skip_previous,
            ),
            CustomIconButton(
              onPressed: playAudio,
              icon: Icons.play_circle_fill,
            ),
            CustomIconButton(
              onPressed: skipNext,
              icon: Icons.skip_next,
            ),
          ],
        )
      ],
    );
  }
}