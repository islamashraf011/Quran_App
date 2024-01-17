import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'edit_image_body.dart';

class EdiHomeViewBody extends StatelessWidget {
  const EdiHomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: const DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(kHomeImage),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const EditImageBody(),
    );
  }
}
