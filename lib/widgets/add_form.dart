import 'package:edu_app/bloc/user/va_main_bloc.dart';
import 'package:edu_app/repository/child_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edu_app/helper/questions.dart';
import 'package:edu_app/widgets/question.dart';
import 'package:edu_app/widgets/answer.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:edu_app/repository/info_rep.dart';

enum SingleCharacter { m, z }

class AddForm extends StatefulWidget {
  ChildRepository _childRepository = new ChildRepository();
  InfoRepository _infoRep = new InfoRepository();

  @override
  _AddFormState createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  VaMainBloc _vaMainBloc;
  final TextEditingController _nameContr = TextEditingController();
  final TextEditingController _dateContr = TextEditingController();
  final TextEditingController _genderContr = TextEditingController();
  SingleCharacter _character = SingleCharacter.m;
  final _questions = questions;
  var _questionIndex = 0;
  var _totalScore = 0;
  String gender;

  ChildRepository get childRepository => widget._childRepository;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _vaMainBloc = VaMainBloc(childRepository: childRepository);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _vaMainBloc.close();
    _nameContr.dispose();
    _dateContr.dispose();
    _genderContr.dispose();
    super.dispose();
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _nameContr.clear();
      _dateContr.clear();
      _genderContr.clear();
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void _onFormSubmitted() {
    if (_nameContr.text != "" && _dateContr.text != "") {

      if(_character.index == 0) {
        gender = "m";
      } else {
        gender = "z";
      }
      _vaMainBloc.add(AddChildInformation(
          name: _nameContr.text,
          dateOfBirth: _dateContr.text,
          gender: gender));

     // _resetQuiz();
    } else {
      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text('Greška! Morate popuniti sve podatke.')));
    }
  }


  //slanje emaila

  void sendEmail() async
  {
    String username = _getUsername();
    String password = _getPassword();
    
   final smtpServer = gmail(username, password);

    // Create our message.
    final message = Message()
      ..from = Address(username, 'App')
      ..recipients.add(getUserEmail())
      ..subject = 'Rezultati testa'
      ..text = getEmailBody();

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code.toString()}: ${p.msg.toString()}');
      }
    }
  }

  String getEmailBody()
  {
    String emailBody = "";

    if(_totalScore <= 15) {
      emailBody = "Poštovani,"
          "\n"
          "\n"
          "prema Vašim odgovorima postoje naznake da Vaše dete boluje od autizma. "
          "Molimo Vas da se posavetujete sa lekarom. "
          "Na našoj aplikaciji možete se više informisati u vezi sa ovom bolešću."
          "\n"
          "\n"
          "Pozdrav.";

    } else if(_totalScore > 10) {
      emailBody = "Poštovani,"
          "\n"
          "\n"
          "prema Vašim odgovorima ne postoje naznake da Vaše dete boluje od autizma."
          "\n"
          "\n"
          "Pozdrav.";
    } else {
      emailBody = "Poštovani,"
          "\n"
          "\n"
          "prema Vašim odgovorima ne postoje značajne naznake da Vaše dete boluje od autizma. "
          "Ukoliko imate sumnje o stanju Vašeg deteta, molimo Vas da se posavetujete sa lekarom. "
          "Na našoj aplikaciji možete se više informisati u vezi sa ovom bolešću."
          "\n"
          "\n"
          "Pozdrav.";
    }

    return emailBody;
  }

  String getUserEmail()
  {
      return widget._childRepository.getUserEmail();
  }


  String _getUsername()
  {
    widget._infoRep.getUsername();
    return widget._infoRep.username;
  }

  String _getPassword()
  {
    widget._infoRep.getPassword();
    return widget._infoRep.password;
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
      bloc: _vaMainBloc,
      listener: (BuildContext context, state) {
        if (state is Loading) {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('Učitavanje..')));
        }

        if (state is Success) {
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text(
                  'Uspešno ste završili test. Rezultate ćete dobiti na mejl.')));

          // rezultati testa...
          sendEmail();
        }

        if (state is Failure) {
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text('Greška! Molimo Vas pokušajte opet.')));
        }
      },
      child: BlocBuilder(
          bloc: _vaMainBloc,
          builder: (BuildContext context, VaMainState state) {
            return Center(
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    height: MediaQuery.of(context).size.height * 0.70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white70,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: Stepper(
                        type: StepperType.horizontal,
                        steps: [
                          Step(
                            title: const Text('Podaci'),
                            isActive: _currentStep == 0,
                            state: _getState(0),
                            content: Column(
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'Ime deteta'),
                                  controller: _nameContr,
                                ),
                                TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        labelText: 'Starost (u mesecima)'),
                                    controller: _dateContr),
                                Row(
                                  children: <Widget>[
                                    Text('Pol'),
                                    Expanded(
                                      child: ListTile(
                                        title: const Text('Muški'),
                                        leading: Radio(
                                          value: SingleCharacter.m,
                                          groupValue: _character,
                                          onChanged: (SingleCharacter value) {
                                            setState(() {
                                              _character = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title: const Text('Ženski'),
                                        leading: Radio(
                                          value: SingleCharacter.z,
                                          groupValue: _character,
                                          onChanged: (SingleCharacter value) {
                                            setState(() {
                                              _character = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Step(
                            isActive: _currentStep == 1,
                            state: _getState(1),
                            title: const Text('Test'),
                            content:_questionIndex < _questions.length
                                ? Column(
                              children: [
                                Question(
                                  questions[_questionIndex]['questionText'],
                                ), //Question
                                ...(questions[_questionIndex]['answers'] as List<Map<String, Object>>)
                                    .map((answer) {
                                  return Answer(() => _answerQuestion(answer['score']), answer['text']);
                                }).toList()
                              ],
                            ) : Center(child: Text('Kraj testa. Idite na odeljak za kraj kako biste videli rezultate testa.'),)

                          ),
                          Step(
                            isActive: _currentStep == 2,
                            state: _getState(2),
                            title: const Text('Kraj'),
                            content: Column(
                              children: <Widget>[
                                RaisedButton(
                                  onPressed: _onFormSubmitted,
                                  color: Colors.blue,
                                  child: Text(
                                    'Pogledaj rezultat',
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
                              if (_currentStep == 0)
                                RaisedButton(
                                  onPressed: onStepContinue,
                                  child: const Text('Dalje'),
                                ),
                            ],
                          );
                        },
                      ),
                    )));
          }),
    );
  }
}
