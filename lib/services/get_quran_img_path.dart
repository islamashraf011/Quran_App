List<String> generateFilePaths() {
  final List<String> quranFilePath = [];
  for (int i = 3; i <= 608; i++) {
    final String formattedNumber = i.toString().padLeft(4, '0');
    final String filePath = 'assets/quran/$formattedNumber.jpg';
    quranFilePath.add(filePath);
  }
  return quranFilePath;
}
