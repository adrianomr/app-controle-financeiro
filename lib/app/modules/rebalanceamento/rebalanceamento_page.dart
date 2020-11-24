import 'package:controle_financeiro/app/model/rebalanceamento_model.dart';
import 'package:controle_financeiro/app/modules/rebalanceamento/components/form_widget.dart';
import 'package:controle_financeiro/app/modules/rebalanceamento/components/list_widget.dart';
import 'package:controle_financeiro/app/modules/rebalanceamento/rebalanceamento_module.dart';
import 'package:controle_financeiro/app/modules/rebalanceamento/rebalanceamento_page_bloc.dart';
import 'package:flutter/material.dart';

class RebalanceamentoPage extends StatefulWidget {
  final String title;

  const RebalanceamentoPage({Key key, this.title = "Rebalanceamento"})
      : super(key: key);

  @override
  _RebalanceamentoPageState createState() => _RebalanceamentoPageState();
}

class _RebalanceamentoPageState extends State<RebalanceamentoPage> {
  final _scaffoldKey = GlobalKey<FormState>();
  RebalanceamentoPageBloc _rebalanceamentoBloc =
      RebalanceamentoModule.to.getBloc<RebalanceamentoPageBloc>();

  @override
  void initState() {
    _rebalanceamentoBloc.getRebalanceamentoList();
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
          child: Column(
            children: <Widget>[
              FormWidget(),
              StreamBuilder(
                stream: _rebalanceamentoBloc
                    .rebalanceamentoListBehaviorSubject.stream,
                builder: (context, snapshot) {
                  List<Rebalanceamento> rebalanceamentoList = snapshot.data;
                  return ListWidget(rebalanceamentoList);
                },
              )
            ],
          ),
        ));
  }
}
