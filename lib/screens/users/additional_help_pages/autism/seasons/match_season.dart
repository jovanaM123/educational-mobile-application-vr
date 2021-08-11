import 'package:edu_app/widgets/games/autism/drag_autism_widget.dart';
import 'package:flutter/material.dart';

class MatchSeason extends StatelessWidget {
  static const routeName = "/seasons-match";

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);

    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: <Widget>[
          Center(
            child: DragAutismWidget("assets/images/seasons/zima.png", "assets/images/seasons/jesen.png",
                 "assets/images/seasons/sneg.png", 1),
          ),
          Center(
            child: DragAutismWidget("assets/images/seasons/zima.png", "assets/images/seasons/leto.png",
                 "assets/images/fruits/apple.png", 2),
          ),
          Center(
            child: DragAutismWidget("assets/images/seasons/jesen.png", "assets/images/seasons/leto.png",
                 "assets/images/seasons/kisobran.png", 1),
          )
        ],
      ),
    );
  }
}

