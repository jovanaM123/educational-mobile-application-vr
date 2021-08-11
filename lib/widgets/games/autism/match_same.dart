import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MatchSame extends StatefulWidget {
  final String imageUrl1;
  final String imageUrl2;
  final String title;
  final int positionOfTrue;
  final String audioLink;

  MatchSame(this.imageUrl1, this.imageUrl2, this.title,
      this.positionOfTrue, this.audioLink);

  @override
  _MatchSameState createState() => _MatchSameState();
}

class _MatchSameState extends State<MatchSame> {
  bool showButton = false;
  final player = AudioPlayer();

  void _guess(int pos) {
    if (pos == widget.positionOfTrue) {
      setState(() {
        showButton = true;
      });
      player.play(widget.audioLink);
    } else {
      player.play(
          "https://firebasestorage.googleapis.com/v0/b/education-app-e79ba.appspot.com/o/autizam%2Fnetacno.mp3?alt=media&token=9996a3f1-56ff-429c-80b0-9289f8d477e0");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Ink.image(
                  image: AssetImage(widget.imageUrl1),
                  //fit: BoxFit.cover,
                  width: 200.0,
                  height: 200.0,
                  child: InkWell(
                    onTap: () => _guess(1),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Ink.image(
                  image: AssetImage(widget.imageUrl2),
                  // fit: BoxFit.cover,
                  width: 200.0,
                  height: 200.0,
                  child: InkWell(
                    onTap: () => _guess(2),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  padding: EdgeInsets.all(20),
                  child: Text(widget.title,
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
              ],
            ),
          ),
          if (showButton)
            SizedBox(
              height: 30,
            ),
          if (showButton)
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: const EdgeInsets.only(right: 15.0),
                child:
                Text("Dalje >>", style: TextStyle(color: Colors.black54)),
              ),
            ),
        ],
      ),
    );
  }
}
