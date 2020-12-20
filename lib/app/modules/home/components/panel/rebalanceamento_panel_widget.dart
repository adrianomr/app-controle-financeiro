import 'package:charts_flutter/flutter.dart';
import 'package:controle_financeiro/app/components/charts/HorizontalBarChart.dart';
import 'package:flutter/cupertino.dart';

class RebalanceamentoPanelWidget extends StatelessWidget {
  List<Series<dynamic, String>> seriesList;

  RebalanceamentoPanelWidget(this.seriesList);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: HorizontalBarChart(seriesList),
    );
  }
}
