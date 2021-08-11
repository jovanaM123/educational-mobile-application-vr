import 'package:edu_app/widgets/games/autism/match_same.dart';
import 'package:flutter/material.dart';

class GuessSeasons extends StatefulWidget {
  static const routeName = "/guess-seasons";

  @override
  _GuessSeasonsState createState() => _GuessSeasonsState();
}

class _GuessSeasonsState extends State<GuessSeasons> {
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
                "assets/images/seasons/bazen.png",
                "assets/images/seasons/skola.png",
                "Šta se oblači na bazenu?",
                1,
                "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/tacno.mp3?alt=media&token=35f98038-2dda-4892-a9de-341bdf824568"
            ),
          ),
          Center(
            child: MatchSame(
                "assets/images/seasons/bickil.png",
                "assets/images/seasons/sneg.png",
                "Šta se oblači kada pada sneg?",
                2,
                "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/tacno.mp3?alt=media&token=35f98038-2dda-4892-a9de-341bdf824568"
            ),
          ),
          Center(
            child: MatchSame(
                "assets/images/objects/lopta.png",
                "assets/images/seasons/kisobran.png",
                "Šta se nosi kada pada kiša?",
                2,
                "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/tacno.mp3?alt=media&token=35f98038-2dda-4892-a9de-341bdf824568"
            ),
          ),
        ],
      ),
    );
  }
}
