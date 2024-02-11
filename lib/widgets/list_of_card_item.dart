import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran_app/views/azkar_view.dart';
import '../constants/constants.dart';
import 'card_item_body.dart';

class ListofCardItem extends StatelessWidget {
  const ListofCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.04,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardItemBody(
                icon: Icons.headphones,
                title: "الاستماع للقـرآن",
                cardColor: kCardColorTwo,
                onTap: () {},
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              CardItemBody(
                icon: Icons.menu_book,
                title: "قـراءة القـرآن",
                cardColor: kCardColorOne,
                onTap: () {},
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardItemBody(
                icon: FontAwesomeIcons.personPraying,
                title: "الأذكـــــار",
                cardColor: kCardColorThree,
                onTap: () {
                  Navigator.pushNamed(context, AzkarView.id);
                },
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              CardItemBody(
                icon: FontAwesomeIcons.handsPraying,
                title: "الأدعـيــــة",
                cardColor: kCardColorFour,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
