import 'package:edu_app/widgets/games/autism/word_widget.dart';
import 'package:flutter/material.dart';

class Animals extends StatelessWidget {
  static const routeName = "/animal";

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);

    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: <Widget>[
          Center(
              child: WordWidget("assets/images/animals/kokoska.png",
                  "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/autizam%2Fkokoska.mp3?alt=media&token=39754595-526c-453c-88d6-3c545cc7c5be")),
          Center(
              child: WordWidget("assets/images/animals/medved.png",
                  "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/autizam%2Fmedved.mp3?alt=media&token=eb1b5994-c60f-4732-9014-90cf5bf51646")),
          Center(
              child: WordWidget("assets/images/animals/zaba.png",
                  "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/autizam%2Fzaba.mp3?alt=media&token=89fcfbe9-6128-4dc5-bf89-ee3ce485e938")),
        ],
      ),
    );
  }
}
