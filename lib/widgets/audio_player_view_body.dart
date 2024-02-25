import 'package:flutter/material.dart';
import '../components/custom_icon_button.dart';
import '../constants/constants.dart';

class AudioPlayerViewBody extends StatelessWidget {
  const AudioPlayerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            kAudioColorOne,
            kAudioColorTwo,
          ],
        ),
      ),
      child: Column(
        children: [
          Text(
            "الشيخ ماهر المعيقلي .. سورة الفاتحة",
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.height * 0.027,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.asset(
            kMaher,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Slider(
            min: 0.0,
            max: 100,
            thumbColor: Colors.white,
            value: 0.2,
            onChanged: (double) {},
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomIconButton(
                onPressed: () {},
                icon: Icons.skip_previous,
              ),
              CustomIconButton(
                onPressed: () {},
                icon: Icons.play_circle_fill,
              ),
              CustomIconButton(
                onPressed: () {},
                icon: Icons.skip_next,
              ),
            ],
          )
        ],
      ),
    );
  }
}
