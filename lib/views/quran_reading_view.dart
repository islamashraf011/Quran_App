import 'package:flutter/material.dart';
import '../components/custom_row_menu_item.dart';
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
        appBar: showAppBar
            ? AppBar(
                backgroundColor: Colors.black.withOpacity(0.7),
                actions: [
                  const Text(
                    "القائمة الرئيسية",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  PopupMenuButton(
                    color: Colors.black.withOpacity(0.6),
                    icon: const Icon(Icons.menu),
                    offset: const Offset(0, 55),
                    itemBuilder: (context) {
                      // Make this step to handle it to take Divider
                      return <PopupMenuEntry<dynamic>>[
                        PopupMenuItem(
                          child: const CustomRowMenuItem(
                            icon: Icons.more_vert,
                            text: "الفهـرس",
                          ),
                          onTap: () {},
                        ),
                        const PopupMenuDivider(
                          height: 20,
                        ),
                        PopupMenuItem(
                          child: const CustomRowMenuItem(
                            icon: Icons.bookmark_add_outlined,
                            text: "حفظ علامـة",
                          ),
                          onTap: () {
                            setState(() {
                              //Make markedPageIndex = current index in PageViewBuilder to put BookMark on It
                              markedPageIndex = pageController.page!.round();
                            });
                          },
                        ),
                        const PopupMenuDivider(
                          height: 20,
                        ),
                        PopupMenuItem(
                          child: const CustomRowMenuItem(
                            icon: Icons.bookmark_border,
                            text: "انتقال إلي العلامـة",
                          ),
                          onTap: () {
                            //Use PageController to go to the CurrentIndex that has the BookMark
                            pageController.animateToPage(
                              markedPageIndex,
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeIn,
                            );
                          },
                        ),
                      ];
                    },
                  ),
                ],
              )
            : null,
        body: QuranReadingViewBody(
          pageController: pageController,
          markedPageIndex: markedPageIndex,
          onBookmarkTap: (index) {
            setState(() {
              markedPageIndex = index;
            });
          },
        ),
      ),
    );
  }
}
