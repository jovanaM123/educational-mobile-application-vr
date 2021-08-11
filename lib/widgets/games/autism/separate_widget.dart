import 'package:flutter/material.dart';

class SeparateWidget extends StatefulWidget {
  final String imageUrl1;
  final String imageUrl2;
  final String imageUrl3;
  final String imageUrl4;
  final int pos1;
  final int pos2;
  final int pos3;
  final int pos4;
  final int type;

  SeparateWidget(this.imageUrl1, this.imageUrl2, this.imageUrl3, this.imageUrl4,
      this.pos1, this.pos2, this.pos3, this.pos4, this.type);
  @override
  _SeparateWidgetState createState() => _SeparateWidgetState();
}

class _SeparateWidgetState extends State<SeparateWidget> {
  int acceptedData1 = 0;
  int acceptedData2 = 0;
  int acceptedData3 = 0;
  int acceptedData4 = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DragTarget<int>(
                    builder: (
                      BuildContext context,
                      List<dynamic> accepted,
                      List<dynamic> rejected,
                    ) {
                      return Container(
                        width: 150,
                        height: 150,
                        color: Colors.lightBlue,
                        child: Center(
                            child: Text(
                          widget.type == 1 ? "Domaće životinje" : "Povrće",
                          style: TextStyle(color: Colors.white),
                        )),
                      );
                    },
                    onAccept: (int data) {
                      setState(() {
                        if (data == 1) {
                          if(widget.pos1 == 1) { acceptedData1 = 1;}
                        } else if (data == 2) {
                          if(widget.pos2 == 1) { acceptedData2 = 1;}
                        } else if (data == 3) {
                          if(widget.pos3 == 1) { acceptedData3 = 1;}
                        } else if (data == 4) {
                          if(widget.pos4 == 1) { acceptedData4 = 1;}
                        }
                      });
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  DragTarget<int>(
                    builder: (
                      BuildContext context,
                      List<dynamic> accepted,
                      List<dynamic> rejected,
                    ) {
                      return Container(
                        width: 150,
                        height: 150,
                        color: Colors.green,
                        child: Center(
                            child: Text(
                          widget.type == 1 ?  "Divlje životinje" : "Voće",
                          style: TextStyle(color: Colors.white),
                        )),
                      );
                    },
                    onAccept: (int data) {
                      setState(() {
                        if (data == 1) {
                          if(widget.pos1 == 2) { acceptedData1 = 1;}
                        } else if (data == 2) {
                          if(widget.pos2 == 2) { acceptedData2 = 1;}
                        } else if (data == 3) {
                          if(widget.pos3 == 2) { acceptedData3 = 1;}
                        } else if (data == 4) {
                          if(widget.pos4 == 2) { acceptedData4 = 1;}
                        }
                      });
                    },
                  ),
                ])),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if(acceptedData1 == 0) Animal(widget.imageUrl1, 1),
            SizedBox(width: 10,),
            if(acceptedData2 == 0) Animal(widget.imageUrl2, 2),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if(acceptedData3 == 0) Animal(widget.imageUrl3, 3),
            SizedBox(width: 10,),
            if(acceptedData4 == 0) Animal(widget.imageUrl4, 4),
          ],
        ),
      ],
    );
  }
}

class Animal extends StatelessWidget {
 final String imageUrl;
 final int pos;

 Animal(this.imageUrl, this.pos);

  @override
  Widget build(BuildContext context) {
    return Draggable<int>(
      data: pos,
      child: Container(
        width: 130,
        height: 130,
        color: Colors.white24,
        child: Center(
          child: Image.asset(
            imageUrl,
            width: 130,
            height: 130,
          ),
        ),
      ),
      feedback: Container(
        width: 130,
        height: 130,
        color: Colors.white24,
        child: Center(
          child: Image.asset(
            imageUrl,
            width: 130,
            height: 130,
          ),
        ),
      ),
      childWhenDragging: Container(
        width: 130,
        height: 130,
        color: Colors.white24,
      ),
    );
  }
}
