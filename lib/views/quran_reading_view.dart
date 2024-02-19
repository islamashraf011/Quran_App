import 'package:flutter/material.dart';
import 'package:quran_app/constants/constants.dart';
import '../widgets/quran_reading_view_body.dart';

class QuranReadingView extends StatefulWidget {
  const QuranReadingView({super.key});
  static String id = "QuranReading";

  @override
  State<QuranReadingView> createState() => _QuranReadingViewState();
}

class _QuranReadingViewState extends State<QuranReadingView> {
  bool showAppBar = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          showAppBar = !showAppBar;
        });
      },
      child: Scaffold(
        backgroundColor: kAzkarColor,
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
                    color: Colors.black.withOpacity(0.7),
                    icon: const Icon(Icons.menu),
                    offset: const Offset(0, 55),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          child: const Text(
                            "الفهـرس",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ];
                    },
                  ),
                ],
              )
            : null,
        body: const QuranReadingViewBody(),
      ),
    );
  }
}
