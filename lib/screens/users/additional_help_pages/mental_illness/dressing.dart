import 'package:edu_app/screens/users/additional_help_pages/mental_illness/dressing_image.dart';
import 'package:flutter/material.dart';

import 'activities.dart';
import '../mental_illness_main_page.dart';

class Dressing extends StatelessWidget {
  static const routeName = '/dressing';
  final String audioLink = "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/oblacenje.wav?alt=media&token=90d1bc90-cce3-470e-b0af-3fa346c4134b";

  @override
  Widget build(BuildContext context) {

    void goTo() {
      Navigator.of(context).pushNamed(DressingImage.routeName);
    }

    return MentalIllnesMainPage(goTo, audioLink, 0);
  }
}
