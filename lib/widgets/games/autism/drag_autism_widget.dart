import 'package:flutter/material.dart';

class DragAutismWidget extends StatefulWidget {
  final String imageUrl1;
  final String imageUrl2;
  final String imageUrl3;
  final int truePos;

  DragAutismWidget(
      this.imageUrl1, this.imageUrl2, this.imageUrl3, this.truePos);
  @override
  _DragAutismWidgetState createState() => _DragAutismWidgetState();
}

class _DragAutismWidgetState extends State<DragAutismWidget> {
  int acceptedData1 = 0;
  int acceptedData2 = 0;

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
                      return acceptedData1 == 1
                          ? Container(
                              color: Colors.green,
                              child: Center(
                                child: Image.asset(
                                  widget.imageUrl1,
                                  width: 150,
                                  height: 150,
                                ),
                              ),
                            )
                          : Container(
                              child: Center(
                                child: Image.asset(
                                  widget.imageUrl1,
                                  width: 150,
                                  height: 150,
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
                  SizedBox(
                    width: 10,
                  ),
                  DragTarget<int>(
                    builder: (
                      BuildContext context,
                      List<dynamic> accepted,
                      List<dynamic> rejected,
                    ) {
                      return acceptedData2 == 1
                          ? Container(
                              color: Colors.green,
                              child: Center(
                                child: Image.asset(
                                  widget.imageUrl2,
                                  width: 150,
                                  height: 150,
                                ),
                              ),
                            )
                          : Container(
                              child: Center(
                                child: Image.asset(
                                  widget.imageUrl2,
                                  width: 150,
                                  height: 150,
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
                ])),
        Draggable<int>(
          // Data is the value this Draggable stores.
          data: widget.truePos,
          child: Container(
            width: 170,
            height: 170,
            color: Colors.white24,
            child: Center(
              child: Image.asset(
                widget.imageUrl3,
                width: 150,
                height: 150,
              ),
            ),
          ),
          feedback: Container(
            width: 170,
            height: 170,
            color: Colors.white24,
            child: Center(
              child: Image.asset(
                widget.imageUrl3,
                width: 150,
                height: 150,
              ),
            ),
          ),
          childWhenDragging: Container(
            height: 170.0,
            width: 170.0,
            color: Colors.white24,
          ),
        ),
      ],
    );
  }
}
