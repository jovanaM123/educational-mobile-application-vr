import 'package:edu_app/screens/users/additional_help_pages/mental_illness/mental_ilnnes_page_images.dart';
import 'package:flutter/material.dart';

class BrushTeethImages extends StatelessWidget {
  static const routeName = '/brush-teeth-images';

  @override
  Widget build(BuildContext context) {
    final double width1 = MediaQuery.of(context).size.width * 0.9;
    final double height1 = MediaQuery.of(context).size.height * 0.6;
    final double width2 = MediaQuery.of(context).size.width * 0.9;
    final double height2 = MediaQuery.of(context).size.height * 0.5;

    return MentalIllnesPageImages('https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/video%2Fbrush_teeth.mp4?alt=media&token=790edaa2-1e77-4aff-9c50-0fe108081ff5',
        "assets/images/pranje_zuba.png", "assets/images/cetkica.png", width1, height1, width2, height2);
  }
}
