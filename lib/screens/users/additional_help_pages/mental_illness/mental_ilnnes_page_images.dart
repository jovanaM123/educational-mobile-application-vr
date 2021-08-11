import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MentalIllnesPageImages extends StatefulWidget {
  final String videoUrl;
  final String imageUrl1;
  final String imageUrl2;
  final double width1;
  final double width2;
  final double heigth1;
  final double heigth2;

  MentalIllnesPageImages(this.videoUrl, this.imageUrl1, this.imageUrl2
      , this.width1, this.heigth1, this.width2, this.heigth2);

  @override
  _MentalIllnesPageImagesState createState() => _MentalIllnesPageImagesState();
}

class _MentalIllnesPageImagesState extends State<MentalIllnesPageImages> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
        widget.videoUrl
      );
    _controller.setVolume(0.0);
    _initializeVideoPlayerFuture = _controller.initialize();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);

    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: <Widget>[
          Center(
            child: Image.asset(
              widget.imageUrl1,
              fit: BoxFit.cover,
              width: widget.width1,
              height: widget.heigth1,
            ),
          ),
          Center(
            child: Image.asset(
              widget.imageUrl2,
              fit: BoxFit.cover,
              width: widget.width2,
              height: widget.heigth2,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FutureBuilder(
                  future: _initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                SizedBox(height: 15,),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (_controller.value.isPlaying) {
                        _controller.pause();
                      } else {
                        _controller.play();
                      }
                    });
                  },
                  child: Icon(
                    _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
