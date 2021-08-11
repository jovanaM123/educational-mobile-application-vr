import 'package:edu_app/model/page_autism.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/words/learn_word.dart';
import 'package:edu_app/widgets/games/autism/pick_games_widget.dart';
import 'package:flutter/material.dart';

import 'guess_word.dart';

class WordsMain extends StatelessWidget {
  static const routeName = "/words-main";

  @override
  Widget build(BuildContext context) {
    void goTo1() {
      Navigator.of(context).pushNamed(GuessWord.routeName);
    }

    void goTo2() {
      Navigator.of(context).pushNamed(LearnWord.routeName);
    }


    List<PageAutism> list = [
      PageAutism(func: goTo1, imageUrl: "assets/images/nauci.png", title: "Pitanja"),
      PageAutism(func: goTo2, imageUrl: "assets/images/question.png", title: "Nauči reč"),
    ];

    return PickGamesWidget(list: list, count: 2);
  }
}