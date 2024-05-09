import 'package:flutter/material.dart';
import 'package:quran_app/services/shared_prefrence_service.dart';
import '../components/show_snack_bar.dart';
import '../services/flutter_local_notification_service.dart';

class NotificationPermission extends StatefulWidget {
  const NotificationPermission({
    super.key,
  });

  @override
  State<NotificationPermission> createState() => _NotificationPermissionState();
}

class _NotificationPermissionState extends State<NotificationPermission> {
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    loadNotificationState();
  }

  void loadNotificationState() async {
    bool lastisSelected = await NotificationState().loadState();
    setState(() {
      isSelected = lastisSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height * 0.046;
    return FloatingActionButton(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: isSelected
          ? Icon(
              Icons.notifications,
              size: size,
            )
          : Icon(
              Icons.notifications_off,
              size: size,
            ),
      onPressed: () async {
        setState(() {
          isSelected = !isSelected;
          NotificationState().saveState(isSelected);
        });
        if (isSelected) {
          await LocalNotificationService.getPermission();
          LocalNotificationService.showPeriodicNotification();

          if (context.mounted) {
            showSnackBar(context, "تم تفعيل الإشـعـارات");
          }
        } else {
          showSnackBar(context, "تم تعطيل الإشـعـارات");
          LocalNotificationService.cancelNotification();
        }
      },
    );
  }
}
