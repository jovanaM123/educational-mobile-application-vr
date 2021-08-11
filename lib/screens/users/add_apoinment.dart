
import 'package:edu_app/bloc/main/user_auth_bloc.dart';
import 'package:edu_app/bloc/user/add_apoinment_bloc.dart';
import 'package:edu_app/repository/app_apoinment_repository.dart';
import 'package:edu_app/screens/users/user_psyh_list.dart';
import 'package:edu_app/widgets/user_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class AddApoinment extends StatefulWidget {
  AddApoinmentyRepository _addApoinmentyRepository =
      new AddApoinmentyRepository();
  final String email;

  AddApoinment(this.email);

  @override
  _AddApoinmentState createState() => _AddApoinmentState();
}

class _AddApoinmentState extends State<AddApoinment> {
  final formKey = GlobalKey<FormState>();
  final format = DateFormat("yyyy-MM-dd HH:mm");
  TextEditingController _dateContr = TextEditingController();
  AddApoinmentBloc _addApoinmentBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addApoinmentBloc = new AddApoinmentBloc(
        addApoinmentyRepository: widget._addApoinmentyRepository);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _addApoinmentBloc.close();
    _dateContr.dispose();
    super.dispose();
  }

  void _addapion() {
    _addApoinmentBloc.add(AddUserApoinment(email: widget.email, date: _dateContr.text));
    _dateContr.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 252, 253, 0.9),
      bottomNavigationBar: UserNav(),
      body: Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.40,
            margin: EdgeInsets.only(top: 120, left: 25, right: 25),
            padding: EdgeInsets.all(10),
            decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: new BorderRadius.circular(8.0),
              boxShadow: <BoxShadow>[
                new BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: new Offset(0.0, 10.0),
                ),
              ],
            ),
            child: BlocListener(
              bloc: _addApoinmentBloc,
              listener: (BuildContext context, state) {
                if (state is Loading) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Učitavanje..')));
                }

                if (state is Reserved) {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Termin koji ste izabrali je zauzet. Molimo Vas izaberite drugi datum.')));
                }

                if (state is Success) {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Uspešno ste zakazali pregled.')));
                }

                if (state is Failure) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('Greška! Molimo Vas pokušajte opet.')));
                }
              },
              child: BlocBuilder(
                bloc: _addApoinmentBloc,
                builder: (BuildContext context, state) {
                  return  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(children: <Widget>[
                              Text(
                                'Zakazivanje pregleda',
                                style:
                                TextStyle(fontSize: 25, color: Colors.black87),
                              ),
                              SizedBox(height: 24),
                              DateTimeField(
                                decoration: InputDecoration(
                                    labelText: 'Izaberite datum i vreme pregleda'),
                                controller: _dateContr,
                                format: format,
                                onShowPicker: (context, currentValue) async {
                                  final date = await showDatePicker(
                                      context: context,
                                      firstDate: DateTime(2020),
                                      initialDate: currentValue ?? DateTime.now(),
                                      lastDate: DateTime(2200));
                                  if (date != null) {
                                    final time = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.fromDateTime(
                                          currentValue ?? DateTime.now()),
                                    );
                                    return DateTimeField.combine(date, time);
                                  } else {
                                    return currentValue;
                                  }
                                },
                              ),
                            ]),
                            SizedBox(height: 35),
                            RaisedButton(
                              onPressed: _addapion,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0)),
                              padding: const EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [Colors.pink, Colors.orangeAccent]),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(80.0)),
                                ),
                                child: Container(
                                  constraints: const BoxConstraints(
                                      minWidth: 55.0,
                                      minHeight:
                                      36.0), // min sizes for Material buttons
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Zakaži',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white70),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },

              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: 30),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pushNamed(UserPsyhList.routeName);
                    },
                  )),
              Container(
                  margin: EdgeInsets.only(top: 30),
                  child: IconButton(
                    icon: Icon(Icons.exit_to_app),
                    onPressed: () {
                      BlocProvider.of<UserAuthBloc>(context).add(
                        LoggedOut(),
                      );
                      Navigator.of(context).pushNamed('/');
                    },
                  )),
            ],
          )
        ],
      ),
    );
  }
}
