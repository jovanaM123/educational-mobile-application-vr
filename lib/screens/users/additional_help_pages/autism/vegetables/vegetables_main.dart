import 'package:edu_app/model/page_autism.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/vegetables/separate_veg.dart';
import 'package:edu_app/widgets/games/autism/pick_games_widget.dart';
import 'package:flutter/material.dart';

import 'guess_veg.dart';

class VegetablesMain extends StatelessWidget {
  static const routeName = "/vegetables-main";

  @override
  Widget build(BuildContext context) {
    void goTo1() {
      Navigator.of(context).pushNamed(SeparateVeg.routeName);
    }

    void goTo2() {
      Navigator.of(context).pushNamed(GuessVeg.routeName);
    }


    List<PageAutism> list = [
      PageAutism(func: goTo1, imageUrl: "assets/images/separate.png", title: "Sortiraj"),
      PageAutism(func: goTo2, imageUrl: "assets/images/question.png", title: "Pogodi voće"),
    ];

    return PickGamesWidget(list: list, count: 2);
  }
}
