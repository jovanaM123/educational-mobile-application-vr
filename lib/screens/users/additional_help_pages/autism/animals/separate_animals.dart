import 'package:flutter/material.dart';
import 'package:edu_app/widgets/games/autism/separate_widget.dart';

class SeparateAnimals extends StatelessWidget {
  static const routeName = "/separate-animals";

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);

    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: <Widget>[
          Center(
            child: SeparateWidget("assets/images/animals/kamila.png", "assets/images/animals/krava.png",
                "assets/images/animals/kokoska.png", "assets/images/animals/lav.png",
                2, 1, 1, 2, 1),
          ),
          Center(
            child: SeparateWidget("assets/images/animals/macka.png", "assets/images/animals/medved.png",
                "assets/images/animals/slon.png", "assets/images/animals/pas.png",
                1, 2, 2, 1, 1),
          ),
        ],
      ),
    );
  }
}
