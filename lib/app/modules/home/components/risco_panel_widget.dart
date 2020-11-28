import 'package:charts_flutter/flutter.dart';
import 'package:controle_financeiro/app/components/charts/VerticalBarChart.dart';
import 'package:flutter/cupertino.dart';

class RiscoPanelWidget extends StatelessWidget {
  List<Series<dynamic, String>> seriesList;

  RiscoPanelWidget(this.seriesList);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: VerticalBarChart(seriesList),
    );
  }
}
