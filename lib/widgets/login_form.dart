
import 'package:edu_app/bloc/main/login/login_bloc.dart';
import 'package:edu_app/bloc/main/user_auth_bloc.dart';
import 'package:edu_app/screens/psyhologists/psyh_home_screen.dart';
import 'package:edu_app/screens/users/user_home_screen.dart';
import 'package:edu_app/widgets/register_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'form_validate_button.dart';

class LoginForm extends StatefulWidget {
  final int type;

  LoginForm(this.type);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailContr = TextEditingController();
  final TextEditingController _passContr = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginBloc _loginBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailContr.addListener(_onEmailChanged);
    _passContr.addListener(_onPasswordChanged);
  }

  void _onEmailChanged() {
    _loginBloc.add(
      EmailChanged(email: _emailContr.text),
    );
  }

  void _onPasswordChanged() {
    _loginBloc.add(
      PasswordChanged(password: _emailContr.text),
    );
  }

  void _onFormSubmitted() {
    if (this._formKey.currentState.validate()) {
      _loginBloc.add(
        LoginWithCredentialsPressed(
            email: _emailContr.text, password: _passContr.text),
      );
    }
    FocusScope.of(context).unfocus();
    setState(() {
      _emailContr.clear();
      _passContr.clear();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailContr.dispose();
    _passContr.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _loginBloc,
      listener: (BuildContext context, LoginState state) {
        if (state.isFailure) {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('Greška! Proverite Vaše kredencijale.')));
        }

        if (state.isSubmitting) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Učitavanje...'),
                CircularProgressIndicator(),
              ],
            ),
          ));
        }

        if (state.isSuccess) {
          BlocProvider.of<UserAuthBloc>(context).add(LoggedIn());
          if(widget.type == 1) {
            Navigator.of(context).pushNamed(UserHomeScreen.routeName);
          } else {
            Navigator.of(context).pushNamed(PsyhHomeScreen.routeName);
          }
        }
      },
      child: BlocBuilder(
          bloc: _loginBloc,
          builder: (BuildContext context, LoginState state) {
            return Center(
              child: Container(
                width: MediaQuery.of(context).size.width*0.90,
                height: MediaQuery.of(context).size.height*0.50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white70,
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Form(
                        key: _formKey,
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: <Widget>[
                            TextFormField(
                              controller: _emailContr,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.email_outlined),
                                  labelText: 'Emejl'),
                              autocorrect: false,
                              validator: (val) {
                                return val.isEmpty ? 'Nevalidan emejl' : null;
                              },
                            ),
                            TextFormField(
                              controller: _passContr,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.lock_outline),
                                  labelText: 'Šifra'),
                              autocorrect: false,
                              obscureText: true,
                              validator: (val) {
                                return val.isEmpty ? 'Nevalidna šifra' : null;
                              },
                            ),
                            SizedBox(height: 20,),
                            FormValidateButton(_onFormSubmitted, widget.type, "Logovanje"),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Nemate nalog?", style: TextStyle(fontSize: 14),),
                                RegisterUser(widget.type),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

