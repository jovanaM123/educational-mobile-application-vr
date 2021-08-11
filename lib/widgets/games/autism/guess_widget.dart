import 'package:flutter/material.dart';

import '../../mental_illness_list_btn.dart';

class GuessWidget extends StatefulWidget {
  final String imageUrl;
  final String question;
  final String title1;
  final String title2;
  final int isTrue;

  GuessWidget(this.imageUrl, this.question, this.isTrue, this.title1, this.title2);

  @override
  _GuessWidgetState createState() => _GuessWidgetState();
}

class _GuessWidgetState extends State<GuessWidget> {
  bool showButton = false;

  void _guess(int yesOro) {
    if(widget.isTrue == yesOro) {
      setState(() {
        showButton = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      padding: EdgeInsets.all(10.00),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
              Text(widget.question,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                      )
              ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    width: 200.0, height: 200.0, child: Image.asset(widget.imageUrl)),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      MentalIllnessListBtn(() => _guess(1), Colors.pink, Colors.orange, widget.title1),
                      MentalIllnessListBtn(() => _guess(0),  Colors.green, Colors.blue, widget.title2),
                    ],
                  ),
                ),
                if (showButton)
                  SizedBox(
                    height: 30,
                  ),
                if (showButton)
                  Container(
                      width: 100.0, height: 100.0, child: Image.asset("assets/images/tacno.png")),
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
