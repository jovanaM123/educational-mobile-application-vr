
import 'package:edu_app/bloc/main/register/register_bloc.dart';
import 'package:edu_app/repository/user_repository.dart';
import 'package:edu_app/widgets/register_user_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserRegisterScreen extends StatefulWidget {
  static const routeName = '/user-register';
  final UserRepository _userRepository;

  UserRegisterScreen(this._userRepository);

  @override
  _UserRegisterScreenState createState() => _UserRegisterScreenState();
}

class _UserRegisterScreenState extends State<UserRegisterScreen> {
  RegisterBloc _registerBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _registerBloc = RegisterBloc(userRepository: widget._userRepository);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _registerBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            BlocProvider<RegisterBloc>(
              create: (context) => _registerBloc,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Colors.pink, Colors.orangeAccent])),
                child: RegisterUserForm(1),
              )
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
