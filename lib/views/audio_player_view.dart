import 'package:flutter/material.dart';
import '../widgets/audio_player_view_body.dart';

class AudioPlayerView extends StatelessWidget {
  const AudioPlayerView({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff071a2c),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            size: MediaQuery.of(context).size.height * 0.04,
          ),
        ),
      ),
      body: AudioPlayerViewBody(
        index: index,
      ),
    );
  }
}
