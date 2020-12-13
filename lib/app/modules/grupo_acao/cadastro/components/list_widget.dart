import 'package:controle_financeiro/app/model/acao_model.dart';
import 'package:controle_financeiro/app/modules/grupo_acao/cadastro/cadastro_page_bloc.dart';
import 'package:flutter/material.dart';

import '../cadastro_module.dart';

class ListWidget extends StatelessWidget {
  List<Acao> acaoList;
  CadastroPageBloc _cadastroPageBloc =
      CadastroModule.to.getBloc<CadastroPageBloc>();

  ListWidget(this.acaoList);

  @override
  Widget build(BuildContext context) {
    if (acaoList == null) return Container();
    return Column(
      children: acaoList.map((acao) => getRow(acao)).toList(),
    );
  }

  Widget getRow(Acao acao) {
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
      key: Key(acao.id.toString()),
      onDismissed: (direction) async {
        await _cadastroPageBloc.deleteAcao(acao);
      },
      child: ListTile(
        title: Row(
          children: <Widget>[
            Text(acao.papel ?? ''),
          ],
        ),
      ),
    );
  }
}
