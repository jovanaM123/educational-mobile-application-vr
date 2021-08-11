import 'package:edu_app/bloc/psyhologist/list_of_appionment_bloc.dart';
import 'package:edu_app/model/Appoinment.dart';
import 'package:edu_app/repository/app_apoinment_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PsyhListAppoiinment extends StatefulWidget {
  AddApoinmentyRepository _addApoinmentyRepository =
      new AddApoinmentyRepository();

  @override
  _PsyhListAppoiinmentState createState() => _PsyhListAppoiinmentState();
}

class _PsyhListAppoiinmentState extends State<PsyhListAppoiinment> {
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
    _listOfAppionmentBloc.add(ShowListOfPsyhApp(ac: 0));
  }

  void manageApp(String id, int type) {
    _listOfAppionmentBloc.add(ManageApp(id: id, type: type, ac: 0));
  }

  @override
  Widget build(BuildContext context) {
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
            Scaffold.of(context).showSnackBar(
                SnackBar(content: Text(state.succ)));
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
            return list.isEmpty
                ? Center(
                    child: Text('Nemate zakazanih pregleda.'),
                  )
                : Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(top: 15) ,
                      child: SingleChildScrollView(
                          child: ListView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(8),
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: EdgeInsets.only(bottom: 20),
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                child: ListTile(
                                    title: Text(
                                        'Pregled zakazao: ' + list[index].user_email),
                                    subtitle: Text('Vreme: ' + list[index].date_of_ap),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          onPressed: () => manageApp(list[index].id, 1),
                                          icon: Icon(Icons.assignment_turned_in_outlined, color: Colors.green,),
                                        ),
                                        IconButton(
                                          onPressed: () => manageApp(list[index].id, 2),
                                          icon: Icon(Icons.close, color: Colors.red,),
                                        ),
                                      ],
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
