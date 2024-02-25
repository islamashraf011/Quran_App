import 'package:bloc/bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meta/meta.dart';
import 'package:quran_app/services/get_audio_path.dart';
part 'audio_player_state.dart';

class AudioPlayerCubit extends Cubit<AudioPlayerState> {
  AudioPlayerCubit() : super(AudioPlayerInitial());
  final List<String> audioList = generateAudioPaths();
  final AudioPlayer audioPlayer = AudioPlayer();

  Future<void> play(int index) async {
    try {
      emit(LoadingAudioState());
      await audioPlayer.setAsset(
        audioList[index],
      );
      await audioPlayer.play();
      emit(
        PlayingAudioState(),
      );
    } catch (e) {
      emit(
        ErrorAudioState(
          errorMsg: e.toString(),
        ),
      );
    }
  }

  Future<void> pause(int index) async {
    try {
      emit(
        LoadingAudioState(),
      );
      await audioPlayer.pause();
      emit(
        PausedAudioState(),
      );
    } catch (e) {
      emit(
        ErrorAudioState(
          errorMsg: e.toString(),
        ),
      );
    }
  }

  Future<void> stop(int index) async {
    try {
      emit(
        LoadingAudioState(),
      );
      await audioPlayer.stop();
      emit(
        StoppedAudioState(),
      );
    } catch (e) {
      emit(
        ErrorAudioState(
          errorMsg: e.toString(),
        ),
      );
    }
  }

  Future<void> skipNext(int index) async {
    try {
      if (index < audioList.length - 1) {
        emit(
          LoadingAudioState(),
        );
        await audioPlayer.setAsset(
          audioList[index + 1],
        );
        await audioPlayer.play();
        emit(
          SkipNextAudioState(
            index: index + 1,
          ),
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

  Future<void> skipPrevios(int index) async {
    try {
      if (index > 0) {
        emit(
          LoadingAudioState(),
        );
        await audioPlayer.setAsset(
          audioList[index - 1],
        );
        await audioPlayer.play();
        emit(
          SkipPreviosAudioState(
            index: index - 1,
          ),
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
