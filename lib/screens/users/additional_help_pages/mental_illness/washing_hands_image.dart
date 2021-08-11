import 'package:flutter/material.dart';

import 'mental_ilnnes_page_images.dart';

class WashingHandsImage extends StatelessWidget {
  static const routeName = "/washing-hands-image";

  @override
  Widget build(BuildContext context) {
    final double width1 = MediaQuery.of(context).size.width * 0.9;
    final double height1 = MediaQuery.of(context).size.height * 0.6;
    final double width2 = MediaQuery.of(context).size.width * 0.9;
    final double height2 = MediaQuery.of(context).size.height * 0.6;

    return MentalIllnesPageImages('https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/video%2Fpranje_ruku.mp4?alt=media&token=8ad7a6b3-0677-4279-bd1c-d5afbd5875c2',
        "assets/images/pranje_ruku.png", "assets/images/sapun.png", width1, height1, width2, height2);
  }
}
