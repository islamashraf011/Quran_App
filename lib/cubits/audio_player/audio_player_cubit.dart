import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:meta/meta.dart';
import 'package:quran_app/constants/constants.dart';
import 'package:quran_app/services/get_audio_path.dart';
import 'package:just_audio/just_audio.dart';
part 'audio_player_state.dart';

class AudioPlayerCubit extends Cubit<AudioPlayerState> {
  AudioPlayerCubit(this.currentIndex) : super(AudioPlayerInitial()) {
    //Used it here to Make listen all time
    setupPlayerListeners();
  }

  final List<String> audioList = generateAudioPaths();
  final AudioPlayer audioPlayer = AudioPlayer();
  Duration? duration;
  Duration? position;
  int currentIndex;
  MediaItem? mediaItem;
  bool isPlaying = false;
  final List<AudioSource> audioSources = [];
  final List<MediaItem> mediaItems = [];

  Future<void> play(int index) async {
    ConcatenatingAudioSource playList = getAudioPlayList();

    try {
      if (!isPlaying && position == Duration.zero) {
        currentIndex = index;
        mediaItem = mediaItems[currentIndex];
        audioPlayer.setAudioSource(
          playList,
          initialIndex: currentIndex,
        );

        audioPlayer.play();
        isPlaying = true;
        currentIndex = index;
        emit(
          PlayingAudioState(),
        );
      } else if (isPlaying && currentIndex == index) {
        audioPlayer.pause();
        isPlaying = false;
        emit(
          PausedAudioState(),
        );
      } else if (isPlaying && currentIndex != index) {
        audioPlayer.stop();
        isPlaying = false;
        emit(
          StoppedAudioState(),
        );
      } else if (position != null) {
        await audioPlayer.seek(position);
        audioPlayer.play();
        isPlaying = true;
        currentIndex = index;

        emit(
          PlayingAudioState(),
        );
      }
    } catch (e) {
      emit(
        ErrorAudioState(
          errorMsg: e.toString(),
        ),
      );
    }
  }

  Future<void> skipNext() async {
    try {
      if (currentIndex < audioList.length - 1) {
        emit(
          LoadingAudioState(),
        );

        await audioPlayer.seekToNext();

        isPlaying = true;

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

        await audioPlayer.seekToPrevious();

        isPlaying = true;

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

//Responsible for Listening to Audio Position & Duration & Player State

  void setupPlayerListeners() {
    try {
      audioPlayer.positionStream.listen(
        (event) {
          position = event;
          emit(LoadingAudioState());
        },
      );
      audioPlayer.durationStream.listen(
        (event) {
          duration = event;
          emit(LoadingAudioState());
        },
      );
      audioPlayer.playerStateStream.listen(
        (playerState) {
          isPlaying = playerState.playing;
          emit(LoadingAudioState());
        },
      );
      audioPlayer.currentIndexStream.listen(
        (index) {
          if (index != null) {
            currentIndex = index;
            emit(LoadingAudioState());
          }
        },
      );
    } catch (e) {
      emit(
        ErrorAudioState(errorMsg: e.toString()),
      );
    }
  }

//Responsible for Make a List of Audio Play List with all Audio Info to play it

  ConcatenatingAudioSource getAudioPlayList() {
    for (int i = 0; i < audioList.length; i++) {
      final String audioPath = audioList[i];
      final String title = "سُوْرَةُ ${surahList[i]}";

      final MediaItem item = MediaItem(
        id: audioPath,
        title: title,
        artist: "الشيخ ماهر المعيقلي",
        artUri: Uri.parse(kMaher),
      );
      mediaItems.add(item);

      final source = AudioSource.asset(
        audioPath,
        tag: item,
      );
      audioSources.add(source);
    }

    final playList = ConcatenatingAudioSource(
      shuffleOrder: DefaultShuffleOrder(),
      useLazyPreparation: true,
      children: audioSources,
    );
    return playList;
  }
}
