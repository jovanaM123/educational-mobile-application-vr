import 'package:edu_app/widgets/games/autism/match_same.dart';
import 'package:flutter/material.dart';

class GuessVeg extends StatefulWidget {
  static const routeName = "/guess-veg";

  @override
  _GuessVegState createState() => _GuessVegState();
}

class _GuessVegState extends State<GuessVeg> {
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
              "assets/images/fruits/kivi.png",
              "assets/images/fruits/kruska.png",
              "KRUŠKA",
              2,
              "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/autizam%2Fkruska.mp3?alt=media&token=6a7a1ad3-5204-4a14-9653-f39ead3d505f"
            ),
          ),
          Center(
            child: MatchSame(
                "assets/images/fruits/jagoda.png",
                "assets/images/fruits/apple.png",
                "JAGODA",
                1,
              "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/autizam%2Fjagoda.mp3?alt=media&token=04457cdc-18fb-4210-b13e-946e31ef9d6c"
            ),
          ),
          Center(
            child: MatchSame(
                "assets/images/fruits/malina.png",
                "assets/images/fruits/limun.png",
                "LIMUN",
                2,
                "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/autizam%2Flimun.mp3?alt=media&token=4f5a012b-03a6-495b-baa0-ca56e09b8f41"
            ),
          ),
          Center(
            child: MatchSame(
                "assets/images/fruits/tresnja.png",
                "assets/images/fruits/banana.png",
                "TREŠNJA",
                1,
              "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/autizam%2Ftresnja.mp3?alt=media&token=b67e3b0c-de91-412c-b61d-2f996d336fc4"
            ),
          ),
          Center(
            child: MatchSame(
                "assets/images/fruits/kupina.png",
                "assets/images/fruits/apple.png",
                "KUPINA",
                1,
                "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/autizam%2Fkupina.mp3?alt=media&token=86bd93ea-9644-4a91-9d7f-9cfbabd4ef07"
            ),
          ),
        ],
      ),
    );
  }
}
