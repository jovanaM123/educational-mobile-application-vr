import 'package:edu_app/widgets/games/down/drag_widget.dart';
import 'package:flutter/material.dart';

class SeparateNumbers extends StatelessWidget {
  static const routeName = "/separate-numbers";

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);

    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: <Widget>[
          Center(
            child: DragWidget("assets/images/numbers/4.png", "assets/images/numbers/5.png",
                "assets/images/numbers/2.png", "assets/images/numbers/2.png", 3),
          ),
          Center(
            child: DragWidget("assets/images/numbers/8.png", "assets/images/numbers/0.png",
                "assets/images/numbers/6.png", "assets/images/numbers/8.png", 1),
          ),
          Center(
            child: DragWidget("assets/images/numbers/7.png", "assets/images/numbers/3.png",
                "assets/images/numbers/1.png", "assets/images/numbers/3.png", 2),
          )
        ],
      ),
    );
  }
}
