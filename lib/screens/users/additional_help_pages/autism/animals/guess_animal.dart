import 'package:edu_app/widgets/games/autism/match_same.dart';
import 'package:flutter/material.dart';

class GuessAnimal extends StatefulWidget {
  static const routeName = "/guess-animal";

  @override
  _GuessAnimalState createState() => _GuessAnimalState();
}

class _GuessAnimalState extends State<GuessAnimal> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);

    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: <Widget>[
          Center(
            child: MatchSame(
                "assets/images/animals/kamila.png",
                "assets/images/animals/kokoska.png",
                "KOKOŠKA",
                2,
                "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/autizam%2Fkokoska.mp3?alt=media&token=39754595-526c-453c-88d6-3c545cc7c5be"
            ),
          ),
          Center(
            child: MatchSame(
                "assets/images/animals/krava.png",
                "assets/images/animals/lav.png",
                "KRAVA",
                1,
                "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/autizam%2Fkrava.mp3?alt=media&token=8cb757e7-5b76-4707-b716-56af0a209166"
            ),
          ),
          Center(
            child: MatchSame(
                "assets/images/animals/macka.png",
                "assets/images/animals/medved.png",
                "MEDVED",
                2,
                "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/autizam%2Fmedved.mp3?alt=media&token=eb1b5994-c60f-4732-9014-90cf5bf51646"
            ),
          ),
          Center(
            child: MatchSame(
                "assets/images/animals/pas.png",
                "assets/images/animals/slon.png",
                "PAS",
                1,
                "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/autizam%2Fpas.mp3?alt=media&token=80f625c3-375b-4036-a0a9-914d789b24d3"
            ),
          ),
          Center(
            child: MatchSame(
                "assets/images/animals/zaba.png",
                "assets/images/animals/zirafa.png",
                "ŽABA",
                1,
                "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/autizam%2Fzaba.mp3?alt=media&token=89fcfbe9-6128-4dc5-bf89-ee3ce485e938"
            ),
          ),
        ],
      ),
    );
  }
}
