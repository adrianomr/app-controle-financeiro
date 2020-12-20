import 'package:charts_flutter/flutter.dart';
import 'package:controle_financeiro/app/components/charts/pie_chart/pie_chart_widget.dart';
import 'package:flutter/cupertino.dart';

class SubgrupoAcoesWidget extends StatelessWidget {
  List<Series<dynamic, String>> seriesList;

  SubgrupoAcoesWidget(this.seriesList);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PieChartWidget(seriesList),
    );
  }
}
