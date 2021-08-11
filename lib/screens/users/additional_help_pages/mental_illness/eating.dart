import 'package:flutter/material.dart';

import '../mental_illness_main_page.dart';
import 'eating_image.dart';

class Eating extends StatelessWidget {
  static const routeName = '/eating';
  final String audioLink = "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/jedenje.wav?alt=media&token=d648a14d-8011-4c41-980e-c9e02da239d2";

  @override
  Widget build(BuildContext context) {

    void goTo() {
      Navigator.of(context).pushNamed(EatingImage.routeName);
    }

    return MentalIllnesMainPage(goTo, audioLink, 0);
  }
}
