import 'package:flutter/material.dart';
import '../widgets/home_view_body.dart';
import '../widgets/notification_permission_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = "Home";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeViewBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: NotificationPermission(),
    );
  }
}
