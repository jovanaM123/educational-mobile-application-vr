import 'package:edu_app/bloc/user/user_appoinment_bloc.dart';
import 'package:edu_app/model/Appoinment.dart';
import 'package:edu_app/repository/app_apoinment_repository.dart';
import 'package:edu_app/screens/psyhologists/video_call_psyh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListOfApp extends StatefulWidget {
  AddApoinmentyRepository _addApoinmentyRepository =
      new AddApoinmentyRepository();

  @override
  _UserListOfAppState createState() => _UserListOfAppState();
}

class _UserListOfAppState extends State<UserListOfApp> {
  UserAppoinmentBloc _userAppoinmentBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userAppoinmentBloc = new UserAppoinmentBloc(
        addApoinmentyRepository: widget._addApoinmentyRepository);
    setState(() {
      _listOfApp();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _userAppoinmentBloc.close();
    super.dispose();
  }

  void _listOfApp() {
    _userAppoinmentBloc.add(ShowListOfUserApp());
  }

  @override
  Widget build(BuildContext context) {
    void _goToVideoCall(String user_email, String id) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => VideoCallPsyh(user_email, id, 1)));
    }

    return Expanded(
      child: Container(
          child: BlocListener(
        bloc: _userAppoinmentBloc,
        listener: (BuildContext context, state) {
          if (state is Failure) {
            Scaffold.of(context).showSnackBar(
                SnackBar(content: Text('Greška! Pokušajte kasnije.')));
          }

          if (state is Loading) {
            Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        child: BlocBuilder(
          bloc: _userAppoinmentBloc,
          builder: (BuildContext context, state) {
            List<Appoinment> list = [];
            if (state is Success) {
              list = state.listOfApp;
            }
            return list.isEmpty
                ? Center(
                    child: Text('Nemate zakazanih pregleda.'),
                  )
                : Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(top: 15),
                    child: SingleChildScrollView(
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(8),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 20),
                            padding:
                                EdgeInsets.symmetric(vertical: 12, horizontal: 2),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: ListTile(
                              title: Text('Pregled zakazan u:',
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold)),
                              subtitle: Text(
                                list[index].date_of_ap,
                                style: TextStyle(fontSize: 13),
                              ),
                              trailing: TextButton(
                                onPressed: () => _goToVideoCall(
                                    list[index].user_email, list[index].id),
                                child: Text(
                                  'Započni video poziv',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: list.length,
                      ),
                    ),
                  );
          },
        ),
      )),
    );
  }
}
