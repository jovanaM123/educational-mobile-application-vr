import 'package:flutter/material.dart';
import 'package:edu_app/widgets/games/down/drag_widget.dart';

class Objects extends StatelessWidget {
  static const routeName = "/objects";

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);

    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: <Widget>[
          Center(
             child: DragWidget("assets/images/geometry/trougao.png", "assets/images/geometry/munja.png",
             "assets/images/geometry/kvadrat.png", "assets/images/geometry/trougao.png", 1),
          ),
          Center(
            child: DragWidget("assets/images/geometry/krug.png", "assets/images/geometry/mesec.png",
                "assets/images/geometry/oktagon.png", "assets/images/geometry/oktagon.png", 3),
          ),
          Center(
            child: DragWidget("assets/images/geometry/polukrug.png", "assets/images/geometry/zvezda.png",
                "assets/images/geometry/strela.png", "assets/images/geometry/zvezda.png", 2),
          )
        ],
      ),
    );
  }
}
