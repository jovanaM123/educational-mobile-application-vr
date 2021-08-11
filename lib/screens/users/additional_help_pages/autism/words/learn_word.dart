import 'package:edu_app/widgets/games/autism/word_widget.dart';
import 'package:flutter/material.dart';

class LearnWord extends StatelessWidget {
  static const routeName = "/learn-word";

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);

    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: <Widget>[
          Center(
            child: WordWidget(
                "assets/images/objects/majmun.png",
                "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/autizam%2Fmajmun.mp3?alt=media&token=0e8dfdef-3309-47ab-a202-37e419a0f2d9"
            ),
          ),
          Center(
            child: WordWidget(
                "assets/images/fruits/kupina.png",
                "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/autizam%2Fkupina.mp3?alt=media&token=86bd93ea-9644-4a91-9d7f-9cfbabd4ef07"
            ),
          ),
          Center(
            child: WordWidget(
                "assets/images/objects/avion.png",
                "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/autizam%2Favion.mp3?alt=media&token=56e362d7-c9ed-405b-baa9-e8337da72e9f"
            ),
          ),
          Center(
            child: WordWidget(
                "assets/images/fruits/limun.png",
                "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/autizam%2Flimun.mp3?alt=media&token=4f5a012b-03a6-495b-baa0-ca56e09b8f41"
            ),
          ),
        ],
      ),
    );
  }
}
