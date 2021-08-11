import 'dart:convert';

import 'package:edu_app/bloc/psyhologist/add_psyh_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PsyhUserForrm extends StatefulWidget {
  @override
  _PsyhUserForrmState createState() => _PsyhUserForrmState();
}

class _PsyhUserForrmState extends State<PsyhUserForrm> {
  TextEditingController firstnameCont = new TextEditingController();
  TextEditingController lastnameCont = new TextEditingController();
  TextEditingController descCont = new TextEditingController();
  AddPsyhBloc _addPsyhBloc;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addPsyhBloc = BlocProvider.of<AddPsyhBloc>(context);
  }

  PickedFile _imageFile;
  var image;

  void _pickImage() async {
    final pickedFile = await _picker.getImage(
      source: ImageSource.camera,
      maxWidth: 150,
      maxHeight: 150,
      imageQuality: 50,
    );
    setState(() {
      _imageFile = pickedFile;
      image = File(pickedFile.path);
    });
  }

  void submitForm() {
    // ignore: unrelated_type_equality_checks
    String encodedImageString = base64.encode(File(_imageFile.path).readAsBytesSync().toList());

    _addPsyhBloc.add(SubmitPsyh(
          firstname: firstnameCont.text,
          lastname: lastnameCont.text,
          description: descCont.text,
          imageUrl: encodedImageString));


    FocusScope.of(context).unfocus();
    setState(() {
      firstnameCont.clear();
      lastnameCont.clear();
      descCont.clear();
      _imageFile = null;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    firstnameCont.dispose();
    lastnameCont.dispose();
    descCont.dispose();
    super.dispose();
  }

  //stepers

  int _currentStep = 0;
  bool complete = false;

  next() {
    _currentStep + 1 != 3
        ? goTo(_currentStep + 1)
        : setState(() => complete = true);
  }

  cancel() {
    if (_currentStep > 0) {
      goTo(_currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => _currentStep = step);
  }

  StepState _getState(int i) {
    if (_currentStep >= i)
      return StepState.complete;
    else
      return StepState.indexed;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _addPsyhBloc,
      listener: (BuildContext context, state) {
        if (state is Loading) {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('Učitavanje..')));
        }

        if (state is Success) {
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text('Uspešno ste dodali nalog.')));
        }

        if (state is Failure) {
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text('Greška! Molimo Vas pokušajte opet.')));
        }
      },
      child: BlocBuilder(
          bloc: _addPsyhBloc,
          builder: (BuildContext context, AddPsyhState state) {
            return Center(
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    height: MediaQuery.of(context).size.height * 0.70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white70,
                    ),
                    child: Column(children: <Widget>[
                      Expanded(
                        child: Stepper(
                          steps: [
                            Step(
                              title: const Text('Novi nalog'),
                              isActive: _currentStep == 0,
                              state: _getState(0),
                              content: Column(
                                children: <Widget>[
                                  TextFormField(
                                    decoration:
                                        InputDecoration(labelText: 'Ime'),
                                    controller: firstnameCont,
                                  ),
                                  TextFormField(
                                    decoration:
                                        InputDecoration(labelText: 'Prezime'),
                                    controller: lastnameCont,
                                  ),
                                ],
                              ),
                            ),
                            Step(
                              isActive: _currentStep == 1,
                              state: _getState(1),
                              title: const Text('Podaci'),
                              content: Column(children: <Widget>[
                                TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'Opis'),
                                  controller: descCont,
                                  maxLines: null,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 2.0, vertical: 14.0),
                                  child: Row(
                                    children: <Widget>[
                                      CircleAvatar(
                                        radius: 40,
                                        backgroundColor: Colors.grey,
                                        child: image != null
                                            ? ClipRRect(
                                          borderRadius: BorderRadius.circular(50),
                                          child: Image.file(
                                            image,
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        )
                                            : Container(
                                          decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius: BorderRadius.circular(50)),
                                          width: 100,
                                          height: 100,
                                          child: Icon(
                                            Icons.camera_alt,
                                            color: Colors.grey[800],
                                          ),
                                        ),
                                      ),
                                      FlatButton.icon(
                                        textColor: Theme.of(context).primaryColor,
                                        onPressed: _pickImage,
                                        icon: Icon(Icons.image),
                                        label: Text('Dodajte sliku'),
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                            Step(
                              isActive: _currentStep == 2,
                              state: _getState(2),
                              title: const Text('Kraj'),
                              content: Column(
                                children: <Widget>[
                                  RaisedButton(
                                    onPressed: submitForm,
                                    color: Colors.blue,
                                    child: Text(
                                      'Napravi nalog',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                          currentStep: _currentStep,
                          onStepContinue: next,
                          onStepTapped: (step) => goTo(step),
                          onStepCancel: cancel,
                          controlsBuilder: (BuildContext context,
                              {VoidCallback onStepContinue,
                              VoidCallback onStepCancel}) {
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                if (_currentStep != 2)
                                  RaisedButton(
                                    onPressed: onStepContinue,
                                    child: const Text('Dalje'),
                                  ),
                                if (_currentStep == 1)
                                  RaisedButton(
                                    onPressed: onStepCancel,
                                    child: const Text('Prethodno'),
                                  ),
                              ],
                            );
                          },
                        ),
                      ),
                    ])));
          }),
    );
  }
}
