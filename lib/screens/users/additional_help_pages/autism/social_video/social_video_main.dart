import 'package:edu_app/widgets/ah_main_image.dart';
import 'package:flutter/material.dart';

class SocialVideoMain extends StatelessWidget {
  static const routeName = "socialvideo-main";

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromRGBO(252, 252, 253, 0.9),
      body: Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 80),
            child: CustomScrollView(
              primary: false,
              slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverGrid.count(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: <Widget>[
                      AhMainImage('Nošenje maske', 'assets/images/play.png',
                          Colors.white, Colors.white, 1, 4),
                      AhMainImage('Igranje', 'assets/images/play.png',
                          Colors.white, Colors.white, 2, 4),
                      AhMainImage('Bez udaranja', 'assets/images/play.png',
                          Colors.white, Colors.white, 3, 4),
                      AhMainImage('O senzornoj sobi', 'assets/images/play.png',
                          Colors.white, Colors.white, 4, 4),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
