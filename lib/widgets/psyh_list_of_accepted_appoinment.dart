import 'package:edu_app/bloc/psyhologist/list_of_appionment_bloc.dart';
import 'package:edu_app/model/Appoinment.dart';
import 'package:edu_app/repository/app_apoinment_repository.dart';
import 'package:edu_app/screens/psyhologists/video_call_psyh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PsyhListOfAcceptedAppoinment extends StatefulWidget {
  AddApoinmentyRepository _addApoinmentyRepository =
      new AddApoinmentyRepository();

  @override
  _PsyhListOfAcceptedAppoinmentState createState() =>
      _PsyhListOfAcceptedAppoinmentState();
}

class _PsyhListOfAcceptedAppoinmentState
    extends State<PsyhListOfAcceptedAppoinment> {
  ListOfAppionmentBloc _listOfAppionmentBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listOfAppionmentBloc = new ListOfAppionmentBloc(
        addApoinmentyRepository: widget._addApoinmentyRepository);
    setState(() {
      _listOfApp();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _listOfAppionmentBloc.close();
    super.dispose();
  }

  void _listOfApp() {
    _listOfAppionmentBloc.add(ShowListOfPsyhApp(ac: 1));
  }


  @override
  Widget build(BuildContext context) {

    void _goToVideoCall(String user_email, String id) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => VideoCallPsyh(user_email, id, 2)));
    }

    return Expanded(
      child: Container(
          child: BlocListener(
        bloc: _listOfAppionmentBloc,
        listener: (BuildContext context, state) {
          if (state is Failure) {
            Scaffold.of(context).showSnackBar(
                SnackBar(content: Text('Greška! Pokušajte kasnije.')));
          }

          if (state is SuccessManage) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text(state.succ)));
          }

          if (state is Loading) {
            Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        child: BlocBuilder(
          bloc: _listOfAppionmentBloc,
          builder: (BuildContext context, state) {
            List<Appoinment> list = [];
            if (state is Success) {
              list = state.listOfApp;
            }
            return list.isEmpty || list.asMap()[0] == null
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
                              title: Text(
                                  'Pregled zakazao: ' + list[index].user_email,
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold)),
                              subtitle: Text(
                                'Vreme: ' + list[index].date_of_ap,
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
