import 'package:edu_app/model/page_autism.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/seasons/guess_season.dart';
import 'package:edu_app/widgets/games/autism/pick_games_widget.dart';
import 'package:flutter/material.dart';

import 'match_season.dart';

class SeasonsMain extends StatelessWidget {
  static const routeName = "/seasons-main";

  @override
  Widget build(BuildContext context) {

    void goTo1() {
      Navigator.of(context).pushNamed(MatchSeason.routeName);
    }

    void goTo2() {
      Navigator.of(context).pushNamed(GuessSeasons.routeName);
    }


    List<PageAutism> list = [
      PageAutism(func: goTo1, imageUrl: "assets/images/match.png", title: "Pogodi godišnje doba"),
      PageAutism(func: goTo2, imageUrl: "assets/images/question.png", title: "Spoji pojmove"),
    ];

    return PickGamesWidget(list: list, count: 2);
  }
}