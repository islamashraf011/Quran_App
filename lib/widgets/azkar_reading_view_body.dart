import 'package:flutter/material.dart';

import '../models/azkar_model.dart';

class AzkarReadingViewBody extends StatelessWidget {
  const AzkarReadingViewBody({super.key, required this.azkar});
  final List<AzkarModel> azkar;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: azkar.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          child: Card(
            color: Colors.white,
            elevation: 5,
            child: ListTile(
              title: Text(
                azkar[index].zekr,
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.height * 0.033,
                  fontWeight: FontWeight.bold,
                  height: MediaQuery.of(context).size.height * 0.0018,
                ),
              ),
              subtitle: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.3,
                    color: Colors.brown[900],
                    child: Column(
                      children: [
                        Text(
                          azkar[index].repeat ?? "01",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.04,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.replay_rounded,
                          color: Colors.white,
                          size: MediaQuery.of(context).size.height * 0.033,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    azkar[index].bless ?? "",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.021,
                      color: Colors.brown[900],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
