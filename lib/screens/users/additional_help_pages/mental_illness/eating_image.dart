import 'package:flutter/material.dart';

import 'mental_ilnnes_page_images.dart';

class EatingImage extends StatelessWidget {
  static const routeName = "/eating-image";

  @override
  Widget build(BuildContext context) {
    final double width1 = MediaQuery.of(context).size.width * 0.9;
    final double height1 = MediaQuery.of(context).size.height * 0.6;
    final double width2 = MediaQuery.of(context).size.width * 0.95;
    final double height2 = MediaQuery.of(context).size.height * 0.5;

    return MentalIllnesPageImages('https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/video%2Fjelo.mp4?alt=media&token=41e47171-1515-453d-8724-e51b8addb489',
        "assets/images/jede.png", "assets/images/hrana.png", width1, height1, width2, height2);
  }
}
