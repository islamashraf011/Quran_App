import 'package:flutter/material.dart';
import '../constants/constants.dart';

void showSurahContent(BuildContext context, PageController pageController) {
  showMenu(
    color: Colors.black.withOpacity(0.8),
    elevation: 0,
    context: context,
    position: RelativeRect.fromDirectional(
      textDirection: TextDirection.rtl,
      start: MediaQuery.of(context).size.width * 0,
      top: MediaQuery.of(context).size.height * 0.09,
      end: MediaQuery.of(context).size.height,
      bottom: MediaQuery.of(context).size.height * 0.13,
    ),
    items: [
      PopupMenuItem<String>(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              height: MediaQuery.of(context).size.height * 0.001,
            ),
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: surahContentsList.length,
            itemBuilder: (context, int index) {
              return ListTile(
                title: Text(
                  "سُوْرَةُ ${surahContentsList[index]}",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height * 0.035,
                  ),
                ),
                onTap: () {
                  pageController.jumpToPage(surahPageNumber[index]);
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
      ),
    ],
  );
}
