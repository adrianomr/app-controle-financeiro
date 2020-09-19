import 'package:controle_financeiro/app/model/transacao_model.dart';
import 'package:controle_financeiro/app/util/data.util.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../transacao_module.dart';
import '../transacao_page_bloc.dart';

class ListWidget extends StatelessWidget {
  List<Transacao> transacaoList;
  TransacaoPageBloc _transacaoBloc =
      TransacaoModule.to.getBloc<TransacaoPageBloc>();

  ListWidget(this.transacaoList);

  @override
  Widget build(BuildContext context) {
    if (transacaoList == null) return Container();
    return Column(
      children: transacaoList.map((transacao) => getRow(transacao)).toList(),
    );
  }

  Widget getRow(Transacao transacao) {
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
      key: Key(transacao.id.toString()),
      onDismissed: (direction) async {
        await _transacaoBloc.delete(transacao);
        await _transacaoBloc.buscaTransacoes();
      },
      child: ListTile(
        title: Row(
          children: <Widget>[
            Text(DataUtil().getDataDiaMesAno(transacao.data.toLocal())),
            Text(
                '   ${transacao.valor > 0 ? 'Compra' : 'Venda'} de ${transacao.papel}'),
          ],
        ),
        trailing: Text(NumberFormat.currency(symbol: 'R\$', decimalDigits: 2)
            .format(transacao.valor.abs() * transacao.quantidade)),
      ),
    );
  }
}
