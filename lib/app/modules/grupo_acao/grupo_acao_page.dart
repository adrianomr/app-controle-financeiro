import 'package:controle_financeiro/app/model/grupo_acao.dart';
import 'package:flutter/material.dart';

import 'cadastro/cadastro_module.dart';
import 'components/list_widget.dart';
import 'grupo_acao_module.dart';
import 'grupo_acao_page_bloc.dart';

class GrupoAcaoPage extends StatefulWidget {
  final String title;

  const GrupoAcaoPage({Key key, this.title = "Grupo de Ações"})
      : super(key: key);

  @override
  _GrupoAcaoPageState createState() => _GrupoAcaoPageState();
}

class _GrupoAcaoPageState extends State<GrupoAcaoPage> {
  final _scaffoldKey = GlobalKey<FormState>();
  GrupoAcaoPageBloc _grupoAcaoBloc =
      GrupoAcaoModule.to.getBloc<GrupoAcaoPageBloc>();

  @override
  void initState() {
    _grupoAcaoBloc.buscaGrupoAcaos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CadastroModule()));
          },
          child: Icon(Icons.add),
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          StreamBuilder(
            stream: _grupoAcaoBloc.grupoAcaoListBehaviorSubject.stream,
            builder: (context, snapshot) {
              List<GrupoAcao> grupoAcaoList = snapshot.data;
              if (grupoAcaoList == null) return Container();
              return ListWidget(grupoAcaoList);
            },
          ),
        ])));
  }
}
