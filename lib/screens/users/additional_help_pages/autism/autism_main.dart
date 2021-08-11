import 'package:edu_app/screens/users/additional_help_pages/autism/autism_activities.dart';
import 'package:flutter/material.dart';

import '../mental_illness_main_page.dart';

class AutismMain extends StatelessWidget {
  static const routeName = '/autism-main';
  final String audioLink = "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/autizam.wav?alt=media&token=e8720b21-316c-4d6e-bbda-dfd47d190f10";

  @override
  Widget build(BuildContext context) {
    void goTo() {
      Navigator.of(context).pushNamed(AutismActivities.routeName);
    }

    return MentalIllnesMainPage(goTo, audioLink, 1);
  }
}
