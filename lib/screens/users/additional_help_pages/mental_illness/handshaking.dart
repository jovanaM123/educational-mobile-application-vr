import 'package:flutter/material.dart';

import '../mental_illness_main_page.dart';
import 'handshaking_image.dart';

class HandShaking extends StatelessWidget {
  static const routeName = '/handshaking';
  final String audioLink = "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/pranjezuba.wav?alt=media&token=dad768a4-e007-40de-84d2-75377e530689";

  @override
  Widget build(BuildContext context) {

    void goTo() {
      Navigator.of(context).pushNamed(HandshakingImage.routeName);
    }

    return MentalIllnesMainPage(goTo, audioLink, 0);
  }
}
