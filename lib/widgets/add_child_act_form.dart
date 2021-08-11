import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edu_app/bloc/user/child_act_bloc.dart';

class AddChildActForm extends StatefulWidget {
  @override
  _AddChildActFormState createState() => _AddChildActFormState();
}


class _AddChildActFormState extends State<AddChildActForm> {
  ChildActBloc _childActBloc;
  TextEditingController minutesSpendInput = new TextEditingController();
  int _grade = 1;
  int type = 1;

  @override
  void initState() {
    super.initState();
    _childActBloc = BlocProvider.of<ChildActBloc>(context);
  }

  @override
  void dispose() {
    minutesSpendInput.dispose();
    super.dispose();
  }

  void _handleGradeChange(int value) {
    setState(() {
      _grade = value;
    });
  }

  void _handleTypeChange(int value) {
    setState(() {
      type = value;
    });
  }

  void submitForm()
  {
    if(minutesSpendInput.text != ''){

      if(_grade == null) {
        _grade = 1;
      }

      /*
          1 - uznemirenost
          2 - agresivnost
          3 - vezbanje cula
       */
      if(type == null) {
        type = 1;
      }

      try{
        int _minSp = int.parse(minutesSpendInput.text);

        _childActBloc.add(AddChildAct(minuteSpend: _minSp, grade: _grade, type: type, ));

        FocusScope.of(context).unfocus();
        setState(() {
          minutesSpendInput.clear();
        });
      } catch(_) {
        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text('Greška! Molimo Vas pokušajte opet.')));
      }
    } else {
      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text('Greška! Morate popuniti sve podatke.')));
    }
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
      bloc: _childActBloc,
      listener: (BuildContext context, state) {
        if (state is Loading) {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('Učitavanje..')));
        }

        if (state is Success) {
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text('Uspešno ste dodali aktivnost.')));
        }

        if (state is Failure) {
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text('Greška! Molimo Vas pokušajte opet.')));
        }
      },
      child: BlocBuilder(
          bloc: _childActBloc,
          builder: (BuildContext context, ChildActState state) {
            return Flexible(
              child: Center(
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
                                title: const Text('Nova aktivnost'),
                                isActive: _currentStep == 0,
                                state: _getState(0),
                                content: Column(
                                  children: <Widget>[
                                    TextFormField(
                                      decoration:
                                      InputDecoration(labelText: 'Vreme provedeno u SS (minuti)'),
                                      controller: minutesSpendInput,
                                    ),
                                    SizedBox(height: 30,),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Ocenite ponašanje vašeg deteta nakon boravka u senzornoj sobi. ',
                                        style: TextStyle(fontSize: 17, color: Colors.black),
                                        children: const <TextSpan>[
                                          TextSpan(text: '(1 - loše, 5 - odlično):'),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text('1'),
                                        Radio(
                                            value: 1,
                                            groupValue: _grade,
                                            onChanged: _handleGradeChange
                                        ),
                                        Text('2'),
                                        Radio(
                                            value: 2,
                                            groupValue: _grade,
                                            onChanged: _handleGradeChange
                                        ),
                                        Text('3'),
                                        Radio(
                                            value: 3,
                                            groupValue: _grade,
                                            onChanged: _handleGradeChange
                                        ),
                                        Text('4'),
                                        Radio(
                                            value: 4,
                                            groupValue: _grade,
                                            onChanged: _handleGradeChange
                                        ),
                                        Text('5'),
                                        Radio(
                                            value: 5,
                                            groupValue: _grade,
                                            onChanged: _handleGradeChange
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Step(
                                isActive: _currentStep == 1,
                                state: _getState(1),
                                title: const Text('Tip'),
                                content: Column(
                                  children: <Widget>[
                                    Text(
                                      'Unesite razlog posete senzorne sobe',
                                      style: TextStyle(fontSize: 17, color: Colors.black),
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text('Uznemirenost'),
                                        Radio(
                                            value: 1,
                                            groupValue: type,
                                            onChanged: _handleTypeChange
                                        ),
                                        Text('Agresivnost'),
                                        Radio(
                                            value: 2,
                                            groupValue: type,
                                            onChanged: _handleTypeChange
                                        ),
                                        Text('Vežba čula'),
                                        Radio(
                                            value: 3,
                                            groupValue: type,
                                            onChanged: _handleTypeChange
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Step(
                                isActive: _currentStep == 2,
                                state: _getState(2),
                                title: const Text('Potvrdi'),
                                content: Column(
                                  children: <Widget>[
                                    RaisedButton(
                                      onPressed: submitForm,
                                      color: Colors.blue,
                                      child: Text(
                                        'Potvrdi',
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
                                    // ignore: deprecated_member_use
                                    RaisedButton(
                                      onPressed: onStepContinue,
                                      child: const Text('Dalje'),
                                    ),
                                  if (_currentStep != 0)
                                    // ignore: deprecated_member_use
                                    RaisedButton(
                                      onPressed: onStepCancel,
                                      child: const Text('Prethodno'),
                                    ),
                                ],
                              );
                            },
                          ),
                        ),
                      ]))),
            );
          }),
    );
  }
}
