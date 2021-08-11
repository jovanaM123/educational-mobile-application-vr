import 'package:edu_app/widgets/games/autism/match_same.dart';
import 'package:flutter/material.dart';

class MatchLettersWithObject extends StatelessWidget {
  static const routeName = "/letters-object";

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
                "assets/images/objects/avion.png",
                "assets/images/objects/lopta.png",
                "A",
                1,
              "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/autizam%2Favion.mp3?alt=media&token=56e362d7-c9ed-405b-baa9-e8337da72e9f"
            ),
          ),
          Center(
            child: MatchSame(
                "assets/images/fruits/jagoda.png",
                "assets/images/objects/auto.png",
                "J",
                1,
                "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/autizam%2Fjagoda.mp3?alt=media&token=04457cdc-18fb-4210-b13e-946e31ef9d6c"
            ),
          ),
          Center(
            child: MatchSame(
                "assets/images/objects/sunce.png",
                "assets/images/objects/oblak.png",
                "O",
                2,
                "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/autizam%2Foblak.mp3?alt=media&token=2439dc5c-0dd8-4d79-8cab-297c17b80347"
            ),
          ),
          Center(
            child: MatchSame(
                "assets/images/objects/traktor.png",
                "assets/images/objects/meda.png",
                "T",
                1,
                "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/autizam%2Ftraktor.mp3?alt=media&token=53477a8e-de04-4bf4-a41d-09fd2766440b"
            ),
          ),
          Center(
            child: MatchSame(
                "assets/images/objects/majmun.png",
                "assets/images/objects/patike.png",
                "M",
                1,
                "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/autizam%2Fmajmun.mp3?alt=media&token=0e8dfdef-3309-47ab-a202-37e419a0f2d9"
            ),
          ),
        ],
      ),
    );
  }
}
