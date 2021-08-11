import 'package:flutter/material.dart';

class DragWidget extends StatefulWidget {
  final String imageUrl1;
  final String imageUrl2;
  final String imageUrl3;
  final String imageUrl4;
  final int truePos;

  DragWidget(this.imageUrl1, this.imageUrl2, this.imageUrl3, this.imageUrl4,
      this.truePos);

  @override
  _DragWidgetState createState() => _DragWidgetState();
}

class _DragWidgetState extends State<DragWidget> {
  int acceptedData1 = 0;
  int acceptedData2 = 0;
  int acceptedData3 = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(vertical: 30),
            color: Colors.teal,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DragTarget<int>(
                    builder: (
                      BuildContext context,
                      List<dynamic> accepted,
                      List<dynamic> rejected,
                    ) {
                      return acceptedData1 == 1
                          ? Container(
                              height: 100.0,
                              width: 100.0,
                              color: Colors.green,
                              child: Center(
                                child: Image.asset(
                                  widget.imageUrl1,
                                  width: 80,
                                  height: 80,
                                ),
                              ),
                            )
                          : Container(
                              height: 100.0,
                              width: 100.0,
                              color: Colors.white,
                              child: Center(
                                child: Image.asset(
                                  widget.imageUrl1,
                                  width: 80,
                                  height: 80,
                                ),
                              ),
                            );
                    },
                    onAccept: (int data) {
                      setState(() {
                        if (widget.truePos == 1) {
                          acceptedData1 = 1;
                        }
                      });
                    },
                  ),
                  SizedBox(width: 10,),
                  DragTarget<int>(
                    builder: (
                        BuildContext context,
                        List<dynamic> accepted,
                        List<dynamic> rejected,
                        ) {
                      return acceptedData2 == 1
                          ? Container(
                        height: 100.0,
                        width: 100.0,
                        color: Colors.green,
                        child: Center(
                          child: Image.asset(
                            widget.imageUrl2,
                            width: 80,
                            height: 80,
                          ),
                        ),
                      )
                          : Container(
                        height: 100.0,
                        width: 100.0,
                        color: Colors.white,
                        child: Center(
                          child: Image.asset(
                            widget.imageUrl2,
                            width: 80,
                            height: 80,
                          ),
                        ),
                      );
                    },
                    onAccept: (int data) {
                      setState(() {
                        if (widget.truePos == 2) {
                          acceptedData2 = 1;
                        }
                      });
                    },
                  ),
                  SizedBox(width: 10,),
                  DragTarget<int>(
                    builder: (
                        BuildContext context,
                        List<dynamic> accepted,
                        List<dynamic> rejected,
                        ) {
                      return acceptedData3 == 1
                          ? Container(
                        height: 100.0,
                        width: 100.0,
                        color: Colors.green,
                        child: Center(
                          child: Image.asset(
                            widget.imageUrl3,
                            width: 80,
                            height: 80,
                          ),
                        ),
                      )
                          : Container(
                        height: 100.0,
                        width: 100.0,
                        color: Colors.white,
                        child: Center(
                          child: Image.asset(
                            widget.imageUrl3,
                            width: 80,
                            height: 80,
                          ),
                        ),
                      );
                    },
                    onAccept: (int data) {
                      setState(() {
                        if (widget.truePos == 3) {
                          acceptedData3 = 1;
                        }
                      });
                    },
                  ),
                ])),
        Draggable<int>(
          // Data is the value this Draggable stores.
          data: widget.truePos,
          child: Container(
            height: 100.0,
            width: 100.0,
            color: Colors.lightBlueAccent,
            child: Center(
              child: Image.asset(
                widget.imageUrl4,
                width: 80,
                height: 80,
              ),
            ),
          ),
          feedback: Container(
            color: Colors.lightBlueAccent,
            height: 100,
            width: 100,
            child: Image.asset(
              widget.imageUrl4,
              width: 80,
              height: 80,
            ),
          ),
          childWhenDragging: Container(
            height: 100.0,
            width: 100.0,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
