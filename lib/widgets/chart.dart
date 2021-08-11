import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Chart extends StatelessWidget {
  final List<charts.Series> seriesList;

  Chart(this.seriesList);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: charts.LineChart(seriesList,
          animate: false,
          defaultRenderer: new charts.LineRendererConfig(includePoints: true)
      ),
    );
  }
}

