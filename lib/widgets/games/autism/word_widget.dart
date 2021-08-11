import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class WordWidget extends StatefulWidget {

  final String imageUrl;
  final String audioUrl;

  WordWidget(this.imageUrl, this.audioUrl);

  @override
  _WordWidgetState createState() => _WordWidgetState();
}

class _WordWidgetState extends State<WordWidget> {
  final player = AudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    play();
  }

  void play() {
    player.play(widget.audioUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Ink.image(
      image: AssetImage(widget.imageUrl),
      width: 300.0,
      height: 300.0,
     /* child: InkWell(
          onTap: play,
      ),*/
    );
  }
}
