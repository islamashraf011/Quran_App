import 'package:flutter/material.dart';

import '../widgets/qiblah_view_body.dart';

class QiblahView extends StatelessWidget {
  const QiblahView({super.key});
  static String id = "Qiblah";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "اتجاه الـقـبـلـة",
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const QiblahViewBody(),
    );
  }
}
