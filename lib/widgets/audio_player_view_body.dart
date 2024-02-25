import 'package:flutter/material.dart';
import '../components/custom_play_audio.dart';
import '../constants/constants.dart';

class AudioPlayerViewBody extends StatelessWidget {
  const AudioPlayerViewBody({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            kAudioColorOne,
            kAudioColorTwo,
          ],
        ),
      ),
      child: CustomPlayAudio(
        index: index,
        sliderMax: 100,
        audioRateValue: 0.2,
        skipPrevious: () {},
        playAudio: () {},
        skipNext: () {},
      ),
    );
  }
}
