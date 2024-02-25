List<String> generateAudioPaths() {
  final List<String> audioFilePath = [];
  for (int i = 0; i <= 114; i++) {
    final String formattedNumber = i.toString().padLeft(4, '0');
    final String filePath = 'assets/audios/$formattedNumber.lite.mp3';
    audioFilePath.add(filePath);
  }
  return audioFilePath;
}
