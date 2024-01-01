import 'package:flutter/material.dart';
import 'package:quran_app/constants/constants.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
            image: const DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage(kHomeImage),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        )
      ],
    );
  }
}
