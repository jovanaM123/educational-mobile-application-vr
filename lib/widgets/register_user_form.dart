
import 'package:edu_app/bloc/main/register/register_bloc.dart';
import 'package:edu_app/screens/psyhologists/psyh_login_screen.dart';
import 'package:edu_app/screens/users/user_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'form_validate_button.dart';

class RegisterUserForm extends StatefulWidget {
  final int type;

  RegisterUserForm(this.type);

  @override
  _RegisterUserFormState createState() => _RegisterUserFormState();
}

class _RegisterUserFormState extends State<RegisterUserForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _passController2 = TextEditingController();

  RegisterBloc _registerBloc;

  void _onEmailChanged() {
    _registerBloc.add(EmailChangedReg(_emailController.text));
  }

  void _onPassChanged() {
    _registerBloc.add(PasswordChangedReg(_passController.text));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passController.addListener(_onPassChanged);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  void _onFormSubmited()  {
    if (this._formKey.currentState.validate()) {
      _registerBloc.add(SubmittedReg(
          email: _emailController.text, password: _passController.text, type: widget.type));
    }

    FocusScope.of(context).unfocus();
    setState(() {
      _emailController.clear();
      _passController.clear();
      _passController2.clear();
    });
  }

  bool isValidEmail(String val) {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(val);
  }

  bool isValidPass(String value){
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _registerBloc,
      listener: (BuildContext context, RegisterState state) {
        if (state.isSubmitting) {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('Učitavanje...')));
        }

        if (state.isFailure) {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('Greška! Molimo Vas pokušajte opet.')));
        }

        if (state.isSuccess) {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('Uspešna registracija')));
        }
      },
      child: BlocBuilder(
        bloc: _registerBloc,
        builder: (BuildContext context, RegisterState state) => Center(
          child: Container(
            width: MediaQuery.of(context).size.width*0.90,
            height: MediaQuery.of(context).size.height*0.60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white70,
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: <Widget>[
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              icon: Icon(Icons.email_outlined),
                              labelText: 'Emejl'),
                          autocorrect: false,
                          validator: (val) {
                            return val.isEmpty || !isValidEmail(val) ? 'Nevalidan emejl' : null;
                          },
                        ),
                        TextFormField(
                          controller: _passController,
                          decoration: InputDecoration(
                              icon: Icon(Icons.lock_outline),
                              labelText: 'Šifra'),
                          autocorrect: false,
                          obscureText: true,
                          validator: (val) {
                            return val.isEmpty || !isValidPass(val)
                                ? 'Navalidna šifra'
                                : null;
                          },
                        ),
                        TextFormField(
                          controller: _passController2,
                          decoration: InputDecoration(
                              icon: Icon(Icons.lock_outline),
                              labelText: 'Ukucajte opet šifru'),
                          autocorrect: false,
                          obscureText: true,
                          validator: (value) {
                            if (value != _passController.text) {
                              return 'Šifre moraju biti iste.';
                            }
                                return null;
                          },
                        ),
                        SizedBox(height: 35,),
                        FormValidateButton(_onFormSubmited, widget.type, "Registracija"),
                        FlatButton(
                            onPressed: () {
                             if(widget.type == 1) {
                               Navigator.of(context)
                                   .pushNamed(UserLoginScreen.routeName);
                             } else {
                               Navigator.of(context)
                                   .pushNamed(PsyhLoginScreen.routeName);
                             }
                            },
                            child: Text('Logujte se postojećim nalogom.', style: TextStyle(fontSize: 14, color: widget.type == 1 ? Colors.pink : Colors.green)))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
