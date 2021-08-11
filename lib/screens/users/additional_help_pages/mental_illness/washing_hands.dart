import 'package:edu_app/screens/users/additional_help_pages/mental_illness/washing_hands_image.dart';
import 'package:flutter/material.dart';

import '../mental_illness_main_page.dart';

class WashingHands extends StatelessWidget {
  static const routeName = '/washing-hands';
  final String audioLink = "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/pranjeruku.wav?alt=media&token=89987d6a-1ced-4310-bd51-55a140047565";


  @override
  Widget build(BuildContext context) {

    void goTo() {
      Navigator.of(context).pushNamed(WashingHandsImage.routeName);
    }

    return MentalIllnesMainPage(goTo, audioLink, 0);
  }
}
