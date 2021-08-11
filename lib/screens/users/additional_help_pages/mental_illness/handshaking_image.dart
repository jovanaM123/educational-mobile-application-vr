import 'package:flutter/material.dart';

import 'mental_ilnnes_page_images.dart';

class HandshakingImage extends StatelessWidget {
  static const routeName = "/handshaking-image";

  @override
  Widget build(BuildContext context) {
    final double width1 = MediaQuery.of(context).size.width * 1;
    final double height1 = MediaQuery.of(context).size.height * 0.6;
    final double width2 = MediaQuery.of(context).size.width * 0.9;
    final double height2 = MediaQuery.of(context).size.height * 0.5;

    return MentalIllnesPageImages('https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/video%2Frukovanje.mp4?alt=media&token=45b855a7-67fe-413f-8976-3cc32d08e988',
        "assets/images/rukovanje.png", "assets/images/ruka.png", width1, height1, width2, height2);
  }
}
