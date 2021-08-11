import 'package:edu_app/screens/users/additional_help_pages/down_syndrome/down_activities.dart';
import 'package:flutter/material.dart';

import '../mental_illness_main_page.dart';

class DownSyndromeMain extends StatelessWidget {
  static const routeName = '/downsyndrome-main';
  final String audioLink = "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/daun.wav?alt=media&token=aff5c38d-5858-4d52-a48c-20db946d7d76";

  @override
  Widget build(BuildContext context) {
    void goTo() {
      Navigator.of(context).pushNamed(DaunActivities.routeName);
    }

    return MentalIllnesMainPage(goTo, audioLink, 1);
  }
}
