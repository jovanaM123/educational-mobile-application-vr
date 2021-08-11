import 'package:flutter/material.dart';
import '../mental_illness_main_page.dart';
import 'brush_teeth_images.dart';

class BrushTeeth extends StatelessWidget {
  static const routeName = '/brush-teeth';
  final String audioLink = "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/rukovanje.wav?alt=media&token=12f0d973-630d-4e19-a0c3-8357b1f55883";


  @override
  Widget build(BuildContext context) {

    void goTo() {
      Navigator.of(context).pushNamed(BrushTeethImages.routeName);
    }

    return MentalIllnesMainPage(goTo, audioLink, 0);
  }
}
