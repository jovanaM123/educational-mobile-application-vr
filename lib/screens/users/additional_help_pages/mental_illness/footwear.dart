import 'package:flutter/material.dart';

import 'activities.dart';
import '../mental_illness_main_page.dart';
import 'footwear_image.dart';

class Footwear extends StatelessWidget {
  static const routeName = '/footwear';
  final String audioLink = "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/obuvanje.wav?alt=media&token=9cb52c57-f026-4aab-af6b-2bf90caa77d5";

  @override
  Widget build(BuildContext context) {

    void goTo() {
      Navigator.of(context).pushNamed(FootwearImage.routeName);
    }

    return MentalIllnesMainPage(goTo, audioLink, 0);
  }
}
