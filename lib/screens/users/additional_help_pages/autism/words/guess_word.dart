import 'package:edu_app/widgets/games/autism/guess_widget.dart';
import 'package:edu_app/widgets/games/autism/word_widget.dart';
import 'package:flutter/material.dart';

class GuessWord extends StatelessWidget {
  static const routeName = "/words-guess";

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);

    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: <Widget>[
          Center(
            child: GuessWidget("assets/images/objects/avion.png",
                "Da li je ovo avion?", 1, "DA", "NE"),
          ),
          Center(
            child: GuessWidget("assets/images/objects/lopta.png",
                "Da li je ovo lopta?", 1, "DA", "NE"),
          ),
          Center(
            child: GuessWidget("assets/images/objects/auto.png",
                "Da li je ovo sunce?", 0, "DA", "NE"),
          ),
          Center(
            child: GuessWidget("assets/images/fruits/limun.png",
                "Da li je ovo banana?", 0, "DA", "NE"),
          ),
        ],
      ),
    );
  }
}
