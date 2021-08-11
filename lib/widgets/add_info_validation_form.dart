import 'dart:math';

import 'package:edu_app/screens/users/add_help_quiz.dart';
import 'package:edu_app/screens/users/additional_help_main.dart';
import 'package:edu_app/widgets/form_validate_button.dart';
import 'package:flutter/material.dart';

class AddInfoValidationForm extends StatefulWidget {
  @override
  _AddInfoValidationFormState createState() => _AddInfoValidationFormState();
}

class _AddInfoValidationFormState extends State<AddInfoValidationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textCont1 = TextEditingController();
  final TextEditingController _textCont2 = TextEditingController();
  final TextEditingController _textCont3 = TextEditingController();
  final FocusNode _firstFocus = FocusNode();
  final FocusNode _secondFocus = FocusNode();
  final FocusNode _thirdFocus = FocusNode();
  String numbers;
  String first;
  String second;
  String third;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    numbers = getNumber();
  }

  String getNumber() {
    Random random = new Random();

    int x1 = random.nextInt(10);
    int x2 = random.nextInt(10);
    int x3 = random.nextInt(10);

    setState(() {
      first = x1.toString();
      second = x2.toString();
      third = x3.toString();
    });

    return getNumberName(x1) +
        ", " +
        getNumberName(x2) +
        ", " +
        getNumberName(x3);
  }

  String getNumberName(int x) {
    String name;

    switch (x) {
      case 1:
        name = 'jedan';
        break;
      case 2:
        name = 'dva';
        break;
      case 3:
        name = 'tri';
        break;
      case 4:
        name = 'četiri';
        break;
      case 5:
        name = 'pet';
        break;
      case 6:
        name = 'šest';
        break;
      case 7:
        name = 'sedam';
        break;
      case 8:
        name = 'osam';
        break;
      case 9:
        name = 'devet';
        break;
      case 0:
        name = 'nula';
        break;
    }

    return name;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _textCont1.dispose();
    _textCont2.dispose();
    _textCont3.dispose();
    super.dispose();
  }

  void _submit() {
    if (this._formKey.currentState.validate()) {
      var a = _textCont1.text;
      var b = _textCont2.text;
      var c = _textCont3.text;

      if (first == a && second == b && third == c) {
        Navigator.of(context).pushNamed(AdditionalHelpMain.routeName);
      }
    }
    FocusScope.of(context).unfocus();
    setState(() {
      _textCont1.clear();
      _textCont2.clear();
      _textCont3.clear();
    });
  }

  _fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Zarad sigurnosti, molimo vas da unesete sledeće brojeve:'),
          SizedBox(
            height: 5,
          ),
          Text(
            numbers,
            style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold, fontSize: 24),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: _formKey,
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 40,
                          child: TextFormField(
                            controller: _textCont1,
                            maxLength: 1,
                            keyboardType: TextInputType.number,
                            autocorrect: false,
                            decoration: InputDecoration(
                                counterText: ''
                            ),
                            focusNode: _firstFocus,
                            onChanged: (term){
                              _fieldFocusChange(context, _firstFocus, _secondFocus);
                            },
                            validator: (val) {
                              return val.isEmpty ? 'X' : null;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 40,
                          child: TextFormField(
                            controller: _textCont2,
                            maxLength: 1,
                            keyboardType: TextInputType.number,
                            autocorrect: false,
                            decoration: InputDecoration(
                                counterText: ''
                            ),
                            focusNode: _secondFocus,
                            onChanged: (term){
                              _fieldFocusChange(context, _secondFocus, _thirdFocus);
                            },
                            validator: (val) {
                              return val.isEmpty ? 'X' : null;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 40,
                          child: TextFormField(
                            controller: _textCont3,
                            maxLength: 1,
                            decoration: InputDecoration(
                                counterText: ''
                            ),
                            keyboardType: TextInputType.number,
                            autocorrect: false,
                            focusNode: _thirdFocus,
                            validator: (val) {
                              return val.isEmpty ? 'X' : null;
                            },
                          ),
                        ),
                      ]),
                  SizedBox(
                    height: 30,
                  ),
                  FormValidateButton(_submit, 1, 'Potvrdi'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
