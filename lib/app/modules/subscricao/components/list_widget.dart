import 'package:controle_financeiro/app/model/subscricao_model.dart';
import 'package:controle_financeiro/app/util/data.util.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../subscricao_module.dart';
import '../subscricao_page_bloc.dart';

class ListWidget extends StatelessWidget {
  List<Subscricao> subscricaoList;
  SubscricaoPageBloc _subscricaoBloc =
      SubscricaoModule.to.getBloc<SubscricaoPageBloc>();

  ListWidget(this.subscricaoList);

  @override
  Widget build(BuildContext context) {
    if (subscricaoList == null) return Container();
    return Column(
      children: subscricaoList.map((subscricao) => getRow(subscricao)).toList(),
    );
  }

  Widget getRow(Subscricao subscricao) {
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
      key: Key(subscricao.id.toString()),
      onDismissed: (direction) async {
        await _subscricaoBloc.delete(subscricao);
        await _subscricaoBloc.buscaTransacoes();
      },
      child: ListTile(
        title: Row(
          children: <Widget>[
            Text(DataUtil().getDataDiaMesAno(subscricao.data.toLocal())),
            Text('   Sub. de ${subscricao.papel}'),
          ],
        ),
        trailing: Text(NumberFormat.currency(symbol: 'R\$', decimalDigits: 2)
            .format(subscricao.valor.abs() * subscricao.quantidade)),
      ),
    );
  }
}
