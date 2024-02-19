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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          showAppBar = !showAppBar;
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
                          onTap: () {},
                        ),
                        const PopupMenuDivider(
                          height: 20,
                        ),
                        PopupMenuItem(
                          child: const CustomRowMenuItem(
                            icon: Icons.bookmark_border,
                            text: "انتقال إلي العلامـة",
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
