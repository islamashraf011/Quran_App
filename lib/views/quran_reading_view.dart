import 'package:flutter/material.dart';
import '../components/custom_quran_app_bar.dart';
import '../widgets/quran_reading_view_body.dart';

class QuranReadingView extends StatefulWidget {
  const QuranReadingView({super.key});
  static String id = "QuranReading";

  @override
  State<QuranReadingView> createState() => _QuranReadingViewState();
}

class _QuranReadingViewState extends State<QuranReadingView> {
  bool showAppBar = false;
  int markedPageIndex = 0; //Default Value that make mark on first page
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          showAppBar = !showAppBar; // To Make AppBar Hide when Click on Screen
        });
      },
      child: Scaffold(
        backgroundColor: Colors.blue[300],
        body: Column(
          children: [
            if (showAppBar)
              CustomQuranAppBar(
                addMark: () {
                  setState(() {
                    //Make markedPageIndex = current index in PageViewBuilder to put BookMark on It
                    markedPageIndex = pageController.page!.round();
                  });
                },
                goToMark: () {
                  // Use PageController to go to the CurrentIndex that has the BookMark
                  pageController.animateToPage(
                    markedPageIndex,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeIn,
                  );
                },
              ),
            Expanded(
              child: QuranReadingViewBody(
                pageController: pageController,
                markedPageIndex: markedPageIndex,
                onBookmarkTap: (index) {
                  setState(() {
                    markedPageIndex = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
