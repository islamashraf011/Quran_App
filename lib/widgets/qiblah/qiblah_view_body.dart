import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:quran_app/widgets/qiblah/check_location_permission_method.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import '../../constants/constants.dart';

class QiblahViewBody extends StatefulWidget {
  const QiblahViewBody({super.key});

  @override
  State<QiblahViewBody> createState() => _QiblahViewBodyState();
}

class _QiblahViewBodyState extends State<QiblahViewBody> {
  late Stream<QiblahDirection> stream;
  late Future<Position> currentLocation;
  @override
  void initState() {
    super.initState();
    currentLocation = getCurrentLocationofDevice(context);
    stream = FlutterQiblah.qiblahStream;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: currentLocation,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Center(
            child: StreamBuilder<QiblahDirection>(
              stream: FlutterQiblah.qiblahStream,
              initialData: null,
              builder: (context, snapshot) {
                final qiblahDirection = snapshot.data;
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(kCompassImage),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.0001,
                      child: Image.asset(
                        kMeccahImage,
                        height: MediaQuery.of(context).size.height * 0.07,
                      ),
                    ),
                    Transform.rotate(
                      angle: (qiblahDirection?.qiblah ?? 0) * (pi / 180) * -1,
                      child: Image.asset(
                        kNeedleImage,
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.yellow,
            ),
          );
        }
      },
    );
  }
}
