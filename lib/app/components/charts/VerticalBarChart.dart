import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class VerticalBarChart extends StatelessWidget {
  static const secondaryMeasureAxisId = 'secondaryMeasureAxisId';
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;

  VerticalBarChart(this.seriesList, {this.animate});

  @override
  Widget build(BuildContext context) {
    // For vertical bar charts, set the [vertical] flag to false.
    return new charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.grouped,
      // vertical: false,
      primaryMeasureAxis:
          new charts.NumericAxisSpec(renderSpec: new charts.NoneRenderSpec()),
      barRendererDecorator: new charts.BarLabelDecorator<String>(),
    );
  }
}
