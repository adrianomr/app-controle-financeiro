import 'package:controle_financeiro/app/model/subscricao_model.dart';
import 'package:controle_financeiro/app/modules/subscricao/subscricao_module.dart';
import 'package:controle_financeiro/app/modules/subscricao/subscricao_page_bloc.dart';
import 'package:flutter/material.dart';

import 'components/form_widget.dart';
import 'components/list_widget.dart';

class SubscricaoPage extends StatefulWidget {
  final String title;

  const SubscricaoPage({Key key, this.title = "Subscrição"}) : super(key: key);

  @override
  _SubscricaoPageState createState() => _SubscricaoPageState();
}

class _SubscricaoPageState extends State<SubscricaoPage> {
  final _scaffoldKey = GlobalKey<FormState>();
  SubscricaoPageBloc _subscricaoBloc =
      SubscricaoModule.to.getBloc<SubscricaoPageBloc>();

  @override
  void initState() {
    _subscricaoBloc.buscaTransacoes();
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
            stream: _subscricaoBloc.subscricaoListBehaviorSubject.stream,
            builder: (context, snapshot) {
              List<Subscricao> subscricaoList = snapshot.data;
              if (subscricaoList == null) return Container();
              return ListWidget(subscricaoList);
            },
          ),
        ])));
  }
}
