
import 'package:edu_app/bloc/main/login/login_bloc.dart';
import 'package:edu_app/repository/user_repository.dart';
import 'package:edu_app/widgets/login_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserLoginScreen extends StatefulWidget {
  static const routeName = '/user-login';
  final UserRepository _userRep = new UserRepository();

  @override
  _UserLoginScreenState createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {
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
        children: <Widget>[
          BlocProvider<LoginBloc>(
            create: (context) => _loginBloc,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.pink, Colors.orangeAccent])),
              child: LoginForm(1),
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
        ],
      ),
    );
  }
}
