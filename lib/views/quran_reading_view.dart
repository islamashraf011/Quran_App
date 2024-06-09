import 'package:flutter/material.dart';
import 'package:quran_app/services/shared_prefrence_service.dart';
import '../components/custom_quran_app_bar.dart';
import '../services/show_surah_content.dart';
import '../widgets/quran_reading_view_body.dart';

class QuranReadingView extends StatefulWidget {
  const QuranReadingView({super.key});
  static String id = "QuranReading";
  @override
  State<QuranReadingView> createState() => _QuranReadingViewState();
}

class _QuranReadingViewState extends State<QuranReadingView> {
  bool showAppBar = false;
  int? markedPageIndex; //Default Value that make mark on first page
  PageController pageController = PageController();

  @override
  void initState() {
    loadMarkedPageIndex();
    super.initState();
  }

  void loadMarkedPageIndex() async {
    int lastIndex = await MarkedPage().loadMarkedPageIndex();
    setState(() {
      markedPageIndex = lastIndex;
    });
  }

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
                addMark: () async {
                  setState(() {
                    //Make markedPageIndex = current index in PageViewBuilder to put BookMark on It
                    markedPageIndex = pageController.page!.round();
                  });
                  await MarkedPage().saveMarkedPageIndex(markedPageIndex!);
                },
                goToMark: () {
                  // Use PageController to go to the CurrentIndex that has the BookMark
                  pageController.animateToPage(
                    markedPageIndex!,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeIn,
                  );
                },
                showContent: () {
                  showSurahContent(context, pageController);
                },
              ),
            Expanded(
              child: QuranReadingViewBody(
                pageController: pageController,
                markedPageIndex: markedPageIndex ?? 0,
                onBookmarkTap: (index) {
                  setState(
                    () {
                      markedPageIndex = index;
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
