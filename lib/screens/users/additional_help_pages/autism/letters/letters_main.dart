import 'package:edu_app/model/page_autism.dart';
import 'package:edu_app/widgets/games/autism/pick_games_widget.dart';
import 'package:flutter/material.dart';

import 'match_letters_with_object.dart';


class LettersMain extends StatelessWidget {
  static const routeName = "/letters-main";

  @override
  Widget build(BuildContext context) {

    void goTo2() {
      Navigator.of(context).pushNamed(MatchLettersWithObject.routeName);
    }


    List<PageAutism> list = [
      PageAutism(func: goTo2, imageUrl: "assets/images/miss.png", title: "Spoji sa predmetom"),
    ];

    return PickGamesWidget(list: list, count: 1);
  }
}
