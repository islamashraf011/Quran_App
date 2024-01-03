import 'package:flutter/material.dart';
import 'custom_list_tile_widget.dart';
import 'pray_time_shape.dart';

class EditImageBody extends StatelessWidget {
  const EditImageBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.height * 0.02,
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.12,
          ),
          CustomListTileWidget(
            title: "يوم 14 ربيع أول",
            titleSize: MediaQuery.of(context).size.height * 0.038,
            subTitle: "يوم الجمعة / 29 سبتمبر",
            subTitleSize: MediaQuery.of(context).size.height * 0.038,
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.03,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const CustomPrayTimeShape(),
          ),
        ],
      ),
    );
  }
}