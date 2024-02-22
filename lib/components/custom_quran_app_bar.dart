import 'package:flutter/material.dart';
import 'custom_row_menu_item.dart';

class CustomQuranAppBar extends StatelessWidget {
  const CustomQuranAppBar(
      {super.key, this.addMark, this.goToMark, this.showContent});
  final Function()? addMark;
  final Function()? goToMark;
  final Function()? showContent;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black.withOpacity(0.7),
      actions: [
        Text(
          "القائمة الرئيسية",
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.063,
            fontWeight: FontWeight.bold,
          ),
        ),
        PopupMenuButton(
          color: Colors.black.withOpacity(0.6),
          icon: const Icon(Icons.menu),
          offset: const Offset(0, 55),
          itemBuilder: (context) {
            // Make this step to handle it to take Divider
            return <PopupMenuEntry<dynamic>>[
              PopupMenuItem(
                onTap: showContent,
                child: const CustomRowMenuItem(
                  icon: Icons.more_vert,
                  text: "الفهـرس",
                ),
              ),
              PopupMenuDivider(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              PopupMenuItem(
                onTap: addMark,
                child: const CustomRowMenuItem(
                  icon: Icons.bookmark_add_outlined,
                  text: "حفظ علامـة",
                ),
              ),
              PopupMenuDivider(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              PopupMenuItem(
                onTap: goToMark,
                child: const CustomRowMenuItem(
                  icon: Icons.bookmark_border,
                  text: "انتقال إلي العلامـة",
                ),
              ),
            ];
          },
        ),
      ],
    );
  }
}
