import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class HorizontalBarChart extends StatelessWidget {
  static const secondaryMeasureAxisId = 'secondaryMeasureAxisId';
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;

  HorizontalBarChart(this.seriesList, {this.animate});

  @override
  Widget build(BuildContext context) {
    // For horizontal bar charts, set the [vertical] flag to false.
    return new charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.grouped,
      vertical: false,
      primaryMeasureAxis:
          new charts.NumericAxisSpec(renderSpec: new charts.NoneRenderSpec()),
      barRendererDecorator: new charts.BarLabelDecorator<String>(),
    );
  }
}
