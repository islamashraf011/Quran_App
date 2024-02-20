import 'package:flutter/material.dart';
import '../services/get_quran_img_path.dart';

class QuranReadingViewBody extends StatelessWidget {
  const QuranReadingViewBody({
    super.key,
    required this.markedPageIndex,
    required this.onBookmarkTap,
    required this.pageController,
  });

  //markedPageIndex represents the index of the currently marked page
  final int markedPageIndex;

  // that is called when a bookmark is tapped. It receives the index of the bookmarked page as a parameter
  final Function(int) onBookmarkTap;

  //responsible for controlling the PageView and animating to specific pages.
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    // Recieve Data (Path) from function in this Variable
    final List<String> quranList = generateFilePaths();

    return PageView.builder(
      controller: pageController,
      itemCount: quranList.length,
      reverse: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Stack(
          fit: StackFit.expand,
          children: [
            // To Make Zoom on images by using this Widget interActiveViewer

            InteractiveViewer(
              maxScale: 4,
              minScale: 0.5,
              child: Image.asset(
                quranList[index],
                fit: BoxFit.fill,
              ),
            ),
            //check if index == markedPageIndex show Book Mark
            index == markedPageIndex
                ? Positioned(
                    top: 20,
                    left: 30,
                    child: Icon(
                      Icons.bookmark,
                      size: 70,
                      color: Colors.red.withOpacity(0.6),
                    ),
                  )
                : const Text(""),
          ],
        );
      },
    );
  }
}
