import 'package:flutter/material.dart';
import 'custom_button_widget.dart';

class CustomListViewofNames extends StatelessWidget {
  const CustomListViewofNames({
    super.key,
    required this.itemCount,
    required this.title,
    this.iconData,
    required this.onTap,
  });
  final int itemCount;
  final List<String> title;
  final List<IconData>? iconData;
  final Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20,
          ),
          child: CustomButton(
            title: title[index],
            icon: iconData != null ? iconData![index] : null,
            iconSize: MediaQuery.of(context).size.width * 0.12,
            onTap: () {
              onTap(index);
            },
          ),
        );
      },
    );
  }
}
