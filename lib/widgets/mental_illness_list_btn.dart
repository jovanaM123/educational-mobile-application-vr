import 'package:flutter/material.dart';

class MentalIllnessListBtn extends StatelessWidget {
  final VoidCallback _onPressed;
  final Color color1;
  final Color color2;
  final String btnText;

  MentalIllnessListBtn(this._onPressed, this.color1, this.color2, this.btnText);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: RaisedButton(
        onPressed: _onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: const EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [color1, color2]),
            borderRadius: BorderRadius.all(Radius.circular(80.0)),
          ),
          child: Container(
            margin: const EdgeInsets.all(10.0),
            constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0), // min sizes for Material buttons
            alignment: Alignment.center,
            child: Text(
              btnText,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
