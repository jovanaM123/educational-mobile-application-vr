import 'package:edu_app/screens/users/additional_help_pages/mental_illness/activities.dart';
import 'package:flutter/material.dart';

import '../mental_illness_main_page.dart';

class MentalIllnessMain extends StatelessWidget {
  static const routeName = '/mentalillness-main';
  final String audioLink = "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/mentalna_retardacija.wav?alt=media&token=4b593dbd-0881-433f-9235-55bd6750aa57";

  @override
  Widget build(BuildContext context) {

    void goTo() {
      Navigator.of(context).pushNamed(Activities.routeName);
    }

    return MentalIllnesMainPage(goTo, audioLink, 1);
  }
}
