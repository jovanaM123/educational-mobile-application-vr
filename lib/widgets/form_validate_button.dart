import 'package:flutter/material.dart';

class FormValidateButton extends StatelessWidget {
  final VoidCallback _onPressed;
  final int type;
  final String btnText;

  FormValidateButton(this._onPressed, this.type, this.btnText);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: _onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      padding: const EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [type == 1 ? Colors.pink : Colors.green, type == 1 ? Colors.orangeAccent : Colors.blue]),
          borderRadius: BorderRadius.all(Radius.circular(80.0)),
        ),
        child: Container(
          constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0), // min sizes for Material buttons
          alignment: Alignment.center,
          child: Text(
            btnText,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.white70),
          ),
        ),
      ),
    );
  }
}
