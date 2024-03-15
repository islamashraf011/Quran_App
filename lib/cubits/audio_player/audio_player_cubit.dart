import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:quran_app/services/get_audio_path.dart';
import 'package:audioplayers/audioplayers.dart';
part 'audio_player_state.dart';

class AudioPlayerCubit extends Cubit<AudioPlayerState> {
  AudioPlayerCubit(this.currentIndex) : super(AudioPlayerInitial());

  final List<String> audioList = generateAudioPaths();
  final AudioPlayer audioPlayer = AudioPlayer();
  Duration? duration = Duration.zero;
  Duration? position;
  int currentIndex;
  bool isPlaying = false;

  Future<void> play(int index) async {
    try {
      if (!isPlaying) {
        await audioPlayer.play(AssetSource(audioList[currentIndex]));
        isPlaying = true;
        emit(PlayingAudioState());
      } else if (isPlaying && currentIndex == index) {
        await audioPlayer.pause();
        isPlaying = false;
        emit(PausedAudioState());
      } else if (isPlaying && currentIndex != index) {
        await audioPlayer.stop();
        isPlaying = false;
        emit(StoppedAudioState());
      } else if (!isPlaying && currentIndex == index) {
        await audioPlayer.resume();
        isPlaying = true;
        emit(PlayingAudioState());
      }
    } catch (e) {
      emit(ErrorAudioState(errorMsg: e.toString()));
    }

    currentIndex = index;
    duration = await audioPlayer.getDuration();
    audioPlayer.onPositionChanged.listen((event) {
      position = event;
      emit(LoadingAudioState());
    });
  }

  Future<void> skipNext() async {
    try {
      if (currentIndex < audioList.length - 1) {
        emit(
          LoadingAudioState(),
        );
        await audioPlayer.play(
          AssetSource(audioList[currentIndex + 1]),
        );
        currentIndex++;
        isPlaying = true;
        duration = await audioPlayer.getDuration();

        emit(
          SkipNextAudioState(),
        );
      } else {
        currentIndex = audioList.length - 1;
        emit(
          SkipNextAudioState(),
        );
      }
    } catch (e) {
      emit(
        ErrorAudioState(
          errorMsg: "Error: Cannot skip to next audio.",
        ),
      );
    }
  }

  Future<void> skipPrevios() async {
    try {
      if (currentIndex > 0) {
        emit(
          LoadingAudioState(),
        );
        await audioPlayer.play(
          AssetSource(audioList[currentIndex - 1]),
        );
        currentIndex--;
        isPlaying = true;
        duration = await audioPlayer.getDuration();

        emit(
          SkipPreviosAudioState(),
        );
      } else {
        currentIndex = 0;
        emit(
          SkipPreviosAudioState(),
        );
      }
    } catch (e) {
      emit(
        ErrorAudioState(
          errorMsg: "Error: Cannot skip to previous audio.",
        ),
      );
    }
  }
}
