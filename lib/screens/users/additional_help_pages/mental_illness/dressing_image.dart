import 'package:flutter/material.dart';
import 'mental_ilnnes_page_images.dart';

class DressingImage extends StatelessWidget {
  static const routeName = "/dressing-image";

  @override
  Widget build(BuildContext context) {
    final double width1 = MediaQuery.of(context).size.width * 0.9;
    final double height1 = MediaQuery.of(context).size.height * 0.9;
    final double width2 = MediaQuery.of(context).size.width * 0.9;
    final double height2 = MediaQuery.of(context).size.height * 0.5;

    return MentalIllnesPageImages('https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/video%2Foblacenje.mp4?alt=media&token=b9582996-37f3-4225-b67e-9ffa98deca76',
        "assets/images/oblacenje.jpg", "assets/images/majica.png", width1, height1, width2, height2);
  }
}
