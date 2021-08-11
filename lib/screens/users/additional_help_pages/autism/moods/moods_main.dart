import 'package:edu_app/model/page_autism.dart';
import 'package:edu_app/widgets/games/autism/pick_games_widget.dart';
import 'package:flutter/material.dart';
import 'guess_mood.dart';

class MoodsMain extends StatelessWidget {
  static const routeName = "/moods-main";

  @override
  Widget build(BuildContext context) {

    void goTo() {
      Navigator.of(context).pushNamed(GuessMood.routeName);
    }


    List<PageAutism> list = [
      PageAutism(func: goTo, imageUrl: "assets/images/question.png", title: "Pogodi raspoloženje"),
    ];

    return PickGamesWidget(list: list, count: 1);
  }
}
