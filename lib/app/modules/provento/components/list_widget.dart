import 'package:controle_financeiro/app/model/provento_model.dart';
import 'package:controle_financeiro/app/util/data.util.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../provento_module.dart';
import '../provento_page_bloc.dart';

class ListWidget extends StatelessWidget {
  List<Provento> proventoList;
  ProventoPageBloc _proventoBloc =
      ProventoModule.to.getBloc<ProventoPageBloc>();

  ListWidget(this.proventoList);

  @override
  Widget build(BuildContext context) {
    if (proventoList == null) return Container();
    return Column(
      children: proventoList.map((provento) => getRow(provento)).toList(),
    );
  }

  Widget getRow(Provento provento) {
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
      key: Key(provento.id.toString()),
      onDismissed: (direction) async {
        await _proventoBloc.delete(provento);
        await _proventoBloc.buscaProventos();
      },
      child: ListTile(
        title: Row(
          children: <Widget>[
            Text(DataUtil().getDataDiaMesAno(provento.data.toLocal())),
            Text('   Provento de ${provento.papel}'),
          ],
        ),
        trailing: Text(NumberFormat.currency(symbol: 'R\$', decimalDigits: 2)
            .format(provento.valor)),
      ),
    );
  }
}
