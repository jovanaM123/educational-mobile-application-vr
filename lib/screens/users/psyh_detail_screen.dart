import 'dart:convert';

import 'package:edu_app/bloc/main/user_auth_bloc.dart';
import 'package:edu_app/bloc/user/add_apoinment_bloc.dart';
import 'package:edu_app/repository/app_apoinment_repository.dart';
import 'package:edu_app/screens/users/user_psyh_list.dart';
import 'package:edu_app/widgets/user_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_apoinment.dart';

class PsyhDetailScreen extends StatefulWidget {
  final String firstname;
  final String lastname;
  final String email;
  final String desc;
  final String imgUrl;
  AddApoinmentyRepository _addApoinmentyRepository = new AddApoinmentyRepository();

  PsyhDetailScreen(
      this.firstname, this.lastname, this.desc, this.email, this.imgUrl);

  @override
  _PsyhDetailScreenState createState() => _PsyhDetailScreenState();
}

class _PsyhDetailScreenState extends State<PsyhDetailScreen> {
  AddApoinmentBloc _addApoinmentBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addApoinmentBloc = new AddApoinmentBloc(addApoinmentyRepository: widget._addApoinmentyRepository);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _addApoinmentBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    void _addApoin(String email) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddApoinment(email)));
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 252, 253, 0.9),
      bottomNavigationBar: UserNav(),
      body: Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          Center(
              child: Stack(children: <Widget>[
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.65,
                width: MediaQuery.of(context).size.width * 1,
                margin: EdgeInsets.only(top: 145, left: 20, right: 20),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 50,),
                    Text(
                      widget.firstname + " " + widget.lastname,
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    SizedBox(height: 5,),
                    Divider(),
                    SizedBox(height: 10,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'O doktoru:',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.desc,
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 15),
                      ),
                    ),
                    Divider(),
                    SizedBox(height: 20,),
                    BlocProvider<AddApoinmentBloc>(
                      create: (BuildContext context) => _addApoinmentBloc,
                      child: Align(
                        alignment: Alignment.center,
                        child: FlatButton(
                          onPressed: () => _addApoin(widget.email),
                          child: Text(
                              'Zakaži pregled',
                              style: TextStyle(
                                  color: Colors.pink,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 80.0),
              alignment: FractionalOffset.topCenter,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: MemoryImage(base64.decode(widget.imgUrl)),
              ),
            ),
          ])),
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
