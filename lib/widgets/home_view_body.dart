import 'package:flutter/material.dart';
import 'package:quran_app/widgets/edit_home_view_body.dart';
import 'list_of_card_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        EdiHomeViewBody(),
        ListofCardItem(),
      ],
    );
  }
}
