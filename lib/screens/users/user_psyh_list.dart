import 'dart:convert';
import 'dart:io';

import 'package:edu_app/bloc/main/user_auth_bloc.dart';
import 'package:edu_app/bloc/psyhologist/add_psyh_bloc.dart';
import 'package:edu_app/repository/psyh_details_respiratory.dart';
import 'package:edu_app/screens/users/psyh_detail_screen.dart';
import 'package:edu_app/widgets/user_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPsyhList extends StatefulWidget {
  static const routeName = '/user-psyh-list';
  PsyhDetailsRespiratory _psyhDetailsRespiratory = new PsyhDetailsRespiratory();

  @override
  _UserPsyhListState createState() => _UserPsyhListState();
}

class _UserPsyhListState extends State<UserPsyhList> {
  AddPsyhBloc _addPsyhBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addPsyhBloc = AddPsyhBloc(userRepository: widget._psyhDetailsRespiratory);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _addPsyhBloc.close();
    super.dispose();
  }

  void goToDetails(String firstname, String lastname, String desc, String email, String imgUrl) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PsyhDetailScreen(firstname, lastname, desc, email, imgUrl)));
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
            margin: EdgeInsets.only(top: 80),
            child: FutureBuilder(
              future: widget._psyhDetailsRespiratory.showAllPsyh(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final details = snapshot.data.docs;

                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.0),
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemCount: details.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(children: <Widget>[
                          GestureDetector(
                            onTap: () => goToDetails(details[index]['firstname'], details[index]['lastname'], details[index]['desc'],
                                details[index]['email'], details[index]['imgUrl']),
                            child: Container(
                              height: 124.0,
                              margin: new EdgeInsets.only(left: 46.0),
                              padding: EdgeInsets.only(left: 50, top: 15.0),
                              decoration: new BoxDecoration(
                                color: new Color(0xFF333366),
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
                              child: ListTile(
                                title: Text(
                                  details[index]['firstname'] +
                                      ' ' +
                                      details[index]['lastname'],
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    '-Više detalja o ovom doktoru-',
                                    style: TextStyle(
                                        color: Colors.orangeAccent,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 16.0),
                            alignment: FractionalOffset.centerLeft,
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage: MemoryImage(
                                  base64.decode(details[index]['imgUrl'])),
                            ),
                          ),
                        ]);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 20,
                        );
                      },
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
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
              ))
        ],
      ),
    );
  }
}
