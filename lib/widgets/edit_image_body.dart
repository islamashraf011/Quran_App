import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import '../components/custom_list_tile_widget.dart';
import 'pray_time_shape.dart';

class EditImageBody extends StatefulWidget {
  const EditImageBody({
    super.key,
  });

  @override
  State<EditImageBody> createState() => _EditImageBodyState();
}

class _EditImageBodyState extends State<EditImageBody> {
  @override
  void initState() {
    super.initState();
    HijriCalendar.setLocal("ar");
    initializeDateFormatting("ar", null);
  }

  @override
  Widget build(BuildContext context) {
    var hijriDate = HijriCalendar.fromDate(DateTime.now());
    var formatHijriDate = hijriDate.toFormat("dd MMMM yyyy");
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.height * 0.02,
      ),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.12,
          ),
          CustomListTileWidget(
            title: formatHijriDate,
            titleSize: MediaQuery.of(context).size.height * 0.038,
            subTitle: DateFormat("EEEE ، D MMMM", "ar").format(DateTime.now()),
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
