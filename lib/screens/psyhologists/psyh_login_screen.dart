
import 'package:edu_app/bloc/main/login/login_bloc.dart';
import 'package:edu_app/repository/user_repository.dart';
import 'package:edu_app/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PsyhLoginScreen extends StatefulWidget {
  static const routeName = '/psyh-login';
  final UserRepository _userRep = new UserRepository();

  @override
  _PsyhLoginScreenState createState() => _PsyhLoginScreenState();
}

class _PsyhLoginScreenState extends State<PsyhLoginScreen> {
  LoginBloc _loginBloc;

  UserRepository get userRep => widget._userRep;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBloc = LoginBloc(userRepository: userRep);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          alignment: Alignment.topLeft,
          children: <Widget> [BlocProvider<LoginBloc>(
            create: (context) => _loginBloc,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.green, Colors.blue])),
              child: LoginForm(2),
            ),
          ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: IconButton(
                color: Colors.white,
                icon: Icon(Icons.arrow_back),
                onPressed: (){
                  Navigator.of(context).pushNamed('/');
                },
              ),
            )
          ]
        )
    );
  }
}
