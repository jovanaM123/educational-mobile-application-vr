import 'package:edu_app/widgets/games/autism/match_same.dart';
import 'package:flutter/material.dart';

class GuessMood extends StatefulWidget {
  static const routeName = "/guess-moods";

  @override
  _GuessMoodState createState() => _GuessMoodState();
}

class _GuessMoodState extends State<GuessMood> {
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
                "assets/images/moods/gadjenje.png",
                "assets/images/moods/iznenadjen.png",
                "ZGAĐEN",
                1,
                "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/gadjenje.mp3?alt=media&token=ad1b9906-ebcc-401c-a129-dab19a78097a"
            ),
          ),
          Center(
            child: MatchSame(
                "assets/images/moods/ljut.png",
                "assets/images/moods/plac.png",
                "TUŽAN",
                2,
                "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/plac.mp3?alt=media&token=13a7d3b6-aa62-4a85-b972-e0d746391130"
            ),
          ),
          Center(
            child: MatchSame(
                "assets/images/moods/uplasen.png",
                "assets/images/moods/smeh.png",
                "SREĆAN",
                2,
                "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/smeh.mp3?alt=media&token=c38b8633-a5ba-4e38-8c67-3435264a7f50"
            ),
          ),
        ],
      ),
    );
  }
}
