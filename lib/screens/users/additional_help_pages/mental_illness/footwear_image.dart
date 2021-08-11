import 'package:flutter/material.dart';

import 'mental_ilnnes_page_images.dart';

class FootwearImage extends StatelessWidget {
  static const routeName = "/footwear-image";

  @override
  Widget build(BuildContext context) {
    final double width1 = MediaQuery.of(context).size.width * 0.9;
    final double height1 = MediaQuery.of(context).size.height * 0.6;
    final double width2 = MediaQuery.of(context).size.width * 1;
    final double height2 = MediaQuery.of(context).size.height * 0.5;

    return MentalIllnesPageImages('https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/video%2Fobuvanje.mp4?alt=media&token=fe3ada17-03f0-4d86-9c80-b00c9d17f64b',
        "assets/images/obuvanje.png", "assets/images/cipele.png", width1, height1, width2, height2);
  }
}
