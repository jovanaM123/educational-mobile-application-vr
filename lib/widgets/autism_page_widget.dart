import 'package:flutter/material.dart';

class AutismPageWidget extends StatelessWidget {
  final VoidCallback _goTo;
  final String imageUrl;
  final String title;

  AutismPageWidget(this._goTo, this.imageUrl, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 22),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: _goTo,
            child: ClipOval(
              child: Container(
                height: 150,
                width: 150,
                color: Colors.grey.shade200,
                child: Image.asset(
                  imageUrl,
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.contain,
                ),
              ),
            )
          ),
          Container(
            height: 60,
            width: 100,
            margin: const EdgeInsets.only(top: 25.0),
            padding: EdgeInsets.all(5.0),
            child:   RaisedButton(
              onPressed: null,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0)),
            padding: EdgeInsets.all(0.0),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.orangeAccent, Colors.deepOrangeAccent]),
                  borderRadius: BorderRadius.all(Radius.circular(80.0)),
                ),
                child: Container(
                  constraints: const BoxConstraints(
                      minWidth: 88.0,
                      minHeight: 36.0), // min sizes for Material buttons
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          ]
      ),
    );
  }
}
