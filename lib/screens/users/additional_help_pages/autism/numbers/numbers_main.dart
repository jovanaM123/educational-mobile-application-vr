import 'package:edu_app/model/page_autism.dart';
import 'package:edu_app/widgets/games/autism/pick_games_widget.dart';
import 'package:edu_app/screens/users/additional_help_pages/autism/numbers/separate_numbers/separate_number.dart';
import 'package:flutter/material.dart';

import 'count/count.dart';

class NumbersMain extends StatelessWidget {
  static const routeName = "/color-main";

  @override
  Widget build(BuildContext context) {

    void goTo2() {
      Navigator.of(context).pushNamed(Count.routeName);
    }

    void goTo3() {
       Navigator.of(context).pushNamed(SeparateNumbers.routeName);
    }

    List<PageAutism> list = [
      PageAutism(func: goTo2, imageUrl: "assets/images/count.png", title: "Izračunaj"),
      PageAutism(func: goTo3, imageUrl: "assets/images/miss.png", title: "Pogodi broj"),
    ];

    return PickGamesWidget(list: list, count: 2,);
  }
}

