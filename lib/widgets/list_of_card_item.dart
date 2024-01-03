import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                title: "الاستماع للقرأن",
                cardColor: kCardColorTwo,
                onTap: () {},
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              CardItemBody(
                icon: Icons.menu_book,
                title: "قرأه القرأن",
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
                title: "الأدعية و الأذكار",
                cardColor: kCardColorThree,
                onTap: () {},
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              CardItemBody(
                icon: FontAwesomeIcons.mapLocationDot,
                title: "العثور علي مسجد",
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
