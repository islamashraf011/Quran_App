import 'package:flutter/material.dart';
import 'package:quran_app/components/custom_surah_listening_button.dart';
import 'package:quran_app/constants/constants.dart';
import 'package:quran_app/views/audio_player_view.dart';

class QuranListeningViewBody extends StatelessWidget {
  const QuranListeningViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    //Used List View Seperated to Add Divider between item
    return ListView.separated(
      itemCount: surahList.length,
      separatorBuilder: (context, index) => Divider(
        height: MediaQuery.of(context).size.height * 0.001,
      ),
      itemBuilder: (context, index) {
        return CustomSurahButton(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return AudioPlayerView(
                    index: index,
                  );
                },
              ),
            );
          },
          numberSurah: index,
          nameSurah: surahList[index],
        );
      },
    );
  }
}
