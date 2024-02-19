import 'package:flutter/material.dart';
import '../services/get_quran_img_path.dart';

class QuranReadingViewBody extends StatelessWidget {
  const QuranReadingViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    // Recieve Data (Path) from function in this Variable
    final List<String> quranList = generateFilePaths();
    return PageView.builder(
      itemCount: quranList.length,
      reverse: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        // To Make Zoom on images used this Widget interActiveViewer
        return InteractiveViewer(
          maxScale: 4,
          minScale: 0.5,
          child: Image.asset(
            quranList[index],
            fit: BoxFit.fill,
          ),
        );
      },
    );
  }
}
