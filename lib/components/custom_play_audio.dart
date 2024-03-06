import 'package:flutter/material.dart';
import 'package:quran_app/services/change_duration_format.dart';
import '../constants/constants.dart';
import 'custom_icon_button.dart';

class CustomPlayAudio extends StatelessWidget {
  const CustomPlayAudio({
    super.key,
    required this.maxDuration,
    required this.position,
    required this.skipPrevious,
    required this.playAudio,
    required this.skipNext,
    required this.title,
    required this.pause,
    this.onChanged,
  });
  final Duration maxDuration;
  final Duration position;
  final Function() skipPrevious;
  final Function() playAudio;
  final Function() skipNext;
  final Function(double)? onChanged;
  final String title;
  final bool pause;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "الشيخ ماهر المعيقلي .. سُوْرَةُ $title",
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
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
          thumbColor: Colors.white,
          min: 0,
          max: maxDuration.inSeconds.toDouble(),
          value: position.inSeconds.toDouble(),
          onChanged: onChanged,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formatDuration(position),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                formatDuration(maxDuration),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
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
              icon: pause ? Icons.play_circle_fill : Icons.pause_circle_filled,
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
