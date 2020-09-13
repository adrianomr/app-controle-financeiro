import 'package:controle_financeiro/app/model/transacao_model.dart';
import 'package:controle_financeiro/app/modules/transacao//transacao_module.dart';
import 'package:controle_financeiro/app/modules/transacao/components/form_widget.dart';
import 'package:controle_financeiro/app/modules/transacao/transacao_page_bloc.dart';
import 'package:flutter/material.dart';

import 'components/list_widget.dart';

class TransacaoPage extends StatefulWidget {
  final String title;

  const TransacaoPage({Key key, this.title = "Transação"}) : super(key: key);

  @override
  _TransacaoPageState createState() => _TransacaoPageState();
}

class _TransacaoPageState extends State<TransacaoPage> {
  final _scaffoldKey = GlobalKey<FormState>();
  TransacaoPageBloc _transacaoBloc =
      TransacaoModule.to.getBloc<TransacaoPageBloc>();

  @override
  void initState() {
    _transacaoBloc.buscaTransacoes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          FormWidget(),
          StreamBuilder(
            stream: _transacaoBloc.transacaoListBehaviorSubject.stream,
            builder: (context, snapshot) {
              List<Transacao> transacaoList = snapshot.data;
              if (transacaoList == null) return Container();
              return ListWidget(transacaoList);
            },
          ),
        ])));
  }
}
