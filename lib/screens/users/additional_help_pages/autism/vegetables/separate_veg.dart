import 'package:edu_app/widgets/games/autism/separate_widget.dart';
import 'package:flutter/material.dart';

class SeparateVeg extends StatelessWidget {
  static const routeName = "/separate-veg";

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);

    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: <Widget>[
          Center(
            child: SeparateWidget("assets/images/fruits/kupina.png", "assets/images/fruits/brokoli.png",
                "assets/images/fruits/jagoda.png", "assets/images/fruits/lav.png",
                2, 1, 2, 2, 2),
          ),
          Center(
            child: SeparateWidget("assets/images/fruits/sarg.png", "assets/images/fruits/kivi.png",
                "assets/images/fruits/apple.png", "assets/images/fruits/kukuruz.png",
                1, 2, 2, 1, 2),
          ),
        ],
      ),
    );
  }
}
