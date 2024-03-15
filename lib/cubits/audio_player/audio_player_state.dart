part of 'audio_player_cubit.dart';

@immutable
abstract class AudioPlayerState {}

final class LoadingAudioState extends AudioPlayerState {}

final class AudioPlayerInitial extends AudioPlayerState {}

final class PlayingAudioState extends AudioPlayerState {}

final class StoppedAudioState extends AudioPlayerState {}

final class PausedAudioState extends AudioPlayerState {}

final class SkipNextAudioState extends AudioPlayerState {}

final class SkipPreviosAudioState extends AudioPlayerState {}

final class ErrorAudioState extends AudioPlayerState {
  final String errorMsg;

  ErrorAudioState({required this.errorMsg});
}
