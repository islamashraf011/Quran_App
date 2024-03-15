import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/cubits/audio_player/audio_player_cubit.dart';
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
    return BlocProvider(
      create: (context) => AudioPlayerCubit(index),
      child: BlocBuilder<AudioPlayerCubit, AudioPlayerState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<AudioPlayerCubit>(context);
          final mediaQuery = MediaQuery.of(context).size;
          final index = cubit.currentIndex;
          bool isPlaying = cubit.isPlaying;
          Duration maxDuration = cubit.duration ?? Duration.zero;
          Duration position = cubit.position ?? Duration.zero;

          return Container(
            width: mediaQuery.width,
            height: mediaQuery.height,
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
              pause: !isPlaying,
              title: surahList[index],
              maxDuration: maxDuration,
              position: position,
              playAudio: () {
                cubit.play(index);
              },
              skipPrevious: () {
                cubit.skipPrevios();
              },
              skipNext: () {
                cubit.skipNext();
              },
            ),
          );
        },
      ),
    );
  }
}
