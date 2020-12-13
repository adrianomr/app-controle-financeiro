import 'package:controle_financeiro/app/model/grupo_acao.dart';
import 'package:flutter/material.dart';

import '../grupo_acao_module.dart';
import '../grupo_acao_page_bloc.dart';

class ListWidget extends StatelessWidget {
  List<GrupoAcao> grupoAcaoList;
  GrupoAcaoPageBloc _grupoAcaoBloc =
      GrupoAcaoModule.to.getBloc<GrupoAcaoPageBloc>();

  ListWidget(this.grupoAcaoList);

  @override
  Widget build(BuildContext context) {
    if (grupoAcaoList == null) return Container();
    return Column(
      children: grupoAcaoList.map((grupoAcao) => getRow(grupoAcao)).toList(),
    );
  }

  Widget getRow(GrupoAcao grupoAcao) {
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
      key: Key(grupoAcao.id.toString()),
      onDismissed: (direction) async {
        await _grupoAcaoBloc.delete(grupoAcao);
        await _grupoAcaoBloc.buscaGrupoAcaos();
      },
      child: ListTile(
        title: Row(
          children: <Widget>[
            Text('${grupoAcao.nome}'),
          ],
        ),
        trailing: Text(grupoAcao.nota.toString()),
      ),
    );
  }
}
