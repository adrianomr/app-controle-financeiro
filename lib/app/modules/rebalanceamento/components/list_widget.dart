import 'package:controle_financeiro/app/model/rebalanceamento_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../rebalanceamento_module.dart';
import '../rebalanceamento_page_bloc.dart';

class ListWidget extends StatelessWidget {
  List<Rebalanceamento> rebalanceamentoList;
  RebalanceamentoPageBloc _rebalanceamentoBloc =
      RebalanceamentoModule.to.getBloc<RebalanceamentoPageBloc>();

  ListWidget(this.rebalanceamentoList);

  @override
  Widget build(BuildContext context) {
    if (rebalanceamentoList == null) return Container();
    return Column(
      children: rebalanceamentoList
          .map((rebalanceamento) => getRow(rebalanceamento))
          .toList(),
    );
  }

  Widget getRow(Rebalanceamento rebalanceamento) {
    return Dismissible(
      // Show a red background as the item is swiped away.
      background: Container(
        padding: EdgeInsets.only(right: 30),
        alignment: Alignment.centerRight,
        child: Icon(
          Icons.delete,
          color: Colors.black38,
        ),
      ),
      key: Key(rebalanceamento.id.toString()),
      onDismissed: (direction) {
        _rebalanceamentoBloc.delete(rebalanceamento);
      },
      child: ListTile(
        title: Text(rebalanceamento.papel),
        trailing: Text(getPercentualText(rebalanceamento.percentual)),
      ),
    );
  }

  getPercentualText(double percentual) {
    if (percentual == null) return "-";
    return NumberFormat.decimalPercentPattern(decimalDigits: 2)
        .format(percentual / 100);
  }
}
