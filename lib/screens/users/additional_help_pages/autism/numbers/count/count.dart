import 'package:edu_app/widgets/games/autism/guess_widget.dart';
import 'package:flutter/material.dart';

class Count extends StatelessWidget {
  static const routeName = "/count";

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);

    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: <Widget>[
          Center(
            child: GuessWidget(
                "assets/images/lopte.png", "Koliko lopti se nalazi na slici?", 1, "3", "1"),
          ),
          Center(
            child: GuessWidget(
                "assets/images/jabuke.png", "Koliko jabuka se nalazi na slici?", 0, "6", "2"),
          ),
          Center(
            child: GuessWidget(
                "assets/images/kola.png", "Koliko automobila se nalazi na slici?", 0, "5", "4"),
          ),
        ],
      ),
    );
  }
}
