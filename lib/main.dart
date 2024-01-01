import 'package:flutter/material.dart';
import 'package:quran_app/views/home_view.dart';

void main() {
  runApp(const QuranApp());
}

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: HomeView.id,
      routes: {
        HomeView.id: (context) => const HomeView(),
      },
    );
  }
}
