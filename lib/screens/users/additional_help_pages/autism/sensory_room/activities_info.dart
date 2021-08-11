import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:edu_app/repository/child_activities_repository.dart';
import 'package:edu_app/widgets/chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ActivitiesInfo extends StatefulWidget {
  final ChildActivitiesRepository _childActivitiesRepository =
      new ChildActivitiesRepository();

  @override
  _ActivitiesInfoState createState() => _ActivitiesInfoState();
}

class _ActivitiesInfoState extends State<ActivitiesInfo> {
  ChildActivitiesRepository get _actRep => widget._childActivitiesRepository;

  double _getAverageActText(int type) {
    double v = 30;

    _actRep.getAverageTimeInSS(type).then((value) {
      setState(() {
        if(type == 1) {
          v = _actRep.averageMinute1;
        } else if (type == 2) {
          v = _actRep.averageMinute2;
        } else {
          v = _actRep.averageMinute3;
        }
      });
    });

    if(type == 1) {
      return _actRep.averageMinute1;
    } else if (type == 2) {
      return _actRep.averageMinute2;
    } else {
      return _actRep.averageMinute3;
    }

  }


  double _getBestAverageTimeText(int type) {
    double val = 30;

    _actRep.getBestTimeInSS(type).then((value) {
      setState(() {
        if(type == 1) {
          val = _actRep.bestAverageMinute1;
        } else if (type == 2) {
          val = _actRep.bestAverageMinute2;
        } else {
          val = _actRep.bestAverageMinute3;
        }
      });
    });

    if(type == 1) {
      return _actRep.bestAverageMinute1;
    } else if (type == 2) {
      return _actRep.bestAverageMinute2;
    } else {
      return _actRep.bestAverageMinute3;
    }

  }


  _dataForGraph(snapshot) {
    var data = snapshot.data.docs;
    final dataForGraph = [];
    DateTime now = new DateTime.now();
    DateTime dat = new DateTime(now.year, now.month, now.day - 10, 0,  0, 0);

    for(int i = 0; i < data.length; i++) {
        if(dat.isBefore(data[i]['date_added'].toDate())) {
          dataForGraph.add(data[i]['minute_spend']);
        }
    }

    return dataForGraph;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 120,),
              Text(
                  'Provedeno vreme u senzornoj sobi (uzrok: uznemirenost)'
              ),
              SizedBox(height: 10,),
              Card(
                child: Container(
                    width: 250,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [Colors.orange, Colors.white24])),
                    child: Column(children: <Widget>[
                      Text(
                        'Prosečno provedeno vreme u SS:',
                        style: TextStyle(color: Colors.black87, fontSize: 20),
                      ),
                      SizedBox(height: 30,),
                      Text(
                        _getAverageActText(1).toString() == null ? 0 : _getAverageActText(1).toString() + " minuta",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                      )
                    ])),
              ),
              SizedBox(height: 20,),
              Card(
                child: Container(
                    width: 250,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [Colors.green, Colors.white24])),
                    child: Column(children: <Widget>[
                      Text(
                        'Preporučeno vreme u SS',
                        style: TextStyle(color: Colors.black87, fontSize: 20),
                      ),
                      SizedBox(height: 30,),
                      Text(
                        _getBestAverageTimeText(1).toString() == null ? 0 : _getBestAverageTimeText(1).toString()  + " minuta",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                      )
                    ])),
              ),
              SizedBox(height: 20,),
              Text(
                  'Provedeno vreme u senzornoj sobi (uzrok: agresivnost)'
              ),
              SizedBox(height: 10,),
              Card(
                child: Container(
                    width: 250,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [Colors.orange, Colors.white24])),
                    child: Column(children: <Widget>[
                      Text(
                        'Prosečno provedeno vreme u SS:',
                        style: TextStyle(color: Colors.black87, fontSize: 20),
                      ),
                      SizedBox(height: 30,),
                      Text(
                        _getAverageActText(2).toString() + " minuta",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                      )
                    ])),
              ),
              SizedBox(height: 20,),
              Card(
                child: Container(
                    width: 250,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [Colors.green, Colors.white24])),
                    child: Column(children: <Widget>[
                      Text(
                        'Preporučeno vreme u SS',
                        style: TextStyle(color: Colors.black87, fontSize: 20),
                      ),
                      SizedBox(height: 30,),
                      Text(
                        _getBestAverageTimeText(2).toString() + " minuta",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                      )
                    ])),
              ),
              SizedBox(height: 20,),
              Text(
                  'Provedeno vreme u senzornoj sobi (uzrok: agresivnost)'
              ),
              SizedBox(height: 10,),
              Card(
                child: Container(
                    width: 250,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [Colors.orange, Colors.white24])),
                    child: Column(children: <Widget>[
                      Text(
                        'Prosečno provedeno vreme u SS:',
                        style: TextStyle(color: Colors.black87, fontSize: 20),
                      ),
                      SizedBox(height: 30,),
                      Text(
                        _getAverageActText(3).toString() + " minuta",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                      )
                    ])),
              ),
              SizedBox(height: 20,),
              Card(
                child: Container(
                    width: 250,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [Colors.green, Colors.white24])),
                    child: Column(children: <Widget>[
                      Text(
                        'Preporučeno vreme u SS',
                        style: TextStyle(color: Colors.black87, fontSize: 20),
                      ),
                      SizedBox(height: 30,),
                      Text(
                        _getBestAverageTimeText(3).toString() + " minuta",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                      )
                    ])),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white
                ),
                child: FutureBuilder(
                  future: widget._childActivitiesRepository.getAllActivitiesForGraph(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data.docs;
                      final dataForGraph = _dataForGraph(snapshot);

                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 30.0),
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 1,
                          itemBuilder: (BuildContext context, int index) {
                            return Stack(children: <Widget>[
                            Text('Vreme provedeno u sobi poslednjih 10 dana:'),
                            Container(
                              width: 200,
                              margin: EdgeInsets.only(top: 30),
                               child: SizedBox(
                                   width: 200,
                                   height: 150,
                                   child: Chart(_createSampleData(dataForGraph))
                               ),
                            )
                            ]);
                          },
                        ),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
      ),
    );
  }
}


/// Create one series with sample hard coded data.
List<charts.Series<LinearAct, double>> _createSampleData(dataForGraph) {
  double a1 = dataForGraph.asMap().containsKey(0) ? dataForGraph[0].toDouble() : 0;
  double a2 = dataForGraph.asMap().containsKey(1) ? dataForGraph[1].toDouble() : 0;
  double a3 = dataForGraph.asMap().containsKey(2) ? dataForGraph[2].toDouble() : 0;
  double a4 = dataForGraph.asMap().containsKey(3) ? dataForGraph[3].toDouble() : 0;
  double a5 = dataForGraph.asMap().containsKey(4) ? dataForGraph[4].toDouble() : 0;
  double a6 = dataForGraph.asMap().containsKey(5) ? dataForGraph[5].toDouble() : 0;
  double a7 = dataForGraph.asMap().containsKey(6) ? dataForGraph[6].toDouble() : 0;
  double a8 = dataForGraph.asMap().containsKey(7) ? dataForGraph[7].toDouble() : 0;
  double a9 = dataForGraph.asMap().containsKey(8) ? dataForGraph[8].toDouble() : 0;
  double a10 = dataForGraph.asMap().containsKey(9) ? dataForGraph[9].toDouble() : 0;

  final data = [
    new LinearAct(0, a1),
    new LinearAct(1, a2),
    new LinearAct(2, a3),
    new LinearAct(3, a4),
    new LinearAct(4, a5),
    new LinearAct(5, a6),
    new LinearAct(6, a7),
    new LinearAct(7, a8),
    new LinearAct(8, a9),
    new LinearAct(9, a10)
  ];


  return [
    new charts.Series<LinearAct, double>(
      id: 'ActivitiesMin',
      colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      domainFn: (LinearAct act, _) => act.days,
      measureFn: (LinearAct act, _) => act.minutes,
      data: data,
    )
  ];
}

/// Sample linear data type.
class LinearAct {
  final double minutes;
  final double days;

  LinearAct(this.days, this.minutes);
}
