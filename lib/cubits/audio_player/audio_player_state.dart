part of 'audio_player_cubit.dart';

@immutable
abstract class AudioPlayerState {}

final class LoadingAudioState extends AudioPlayerState {}

final class AudioPlayerInitial extends AudioPlayerState {}

final class PlayingAudioState extends AudioPlayerState {}

final class StoppedAudioState extends AudioPlayerState {}

final class PausedAudioState extends AudioPlayerState {}

final class SkipNextAudioState extends AudioPlayerState {
  final int index;

  SkipNextAudioState({required this.index});
}

final class SkipPreviosAudioState extends AudioPlayerState {
  final int index;

  SkipPreviosAudioState({required this.index});
}

final class ErrorAudioState extends AudioPlayerState {
  final String errorMsg;

  ErrorAudioState({required this.errorMsg});
}
