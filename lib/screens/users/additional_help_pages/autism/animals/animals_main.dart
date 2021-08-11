import 'package:edu_app/model/page_autism.dart';
import 'package:edu_app/widgets/games/autism/pick_games_widget.dart';
import 'separate_animals.dart';
import 'package:flutter/material.dart';
import 'guess_animal.dart';


class AnimalsMain extends StatelessWidget {
  static const routeName = "/animals-main";

  @override
  Widget build(BuildContext context) {
    void goTo1() {
      Navigator.of(context).pushNamed(SeparateAnimals.routeName);
    }

    void goTo2() {
      Navigator.of(context).pushNamed(GuessAnimal.routeName);
    }


    List<PageAutism> list = [
      PageAutism(func: goTo1, imageUrl: "assets/images/separate.png", title: "Razvrstaj"),
      PageAutism(func: goTo2, imageUrl: "assets/images/match.png", title: "Pogodi životinju"),
    ];

    return PickGamesWidget(list: list, count: 2);
  }
}