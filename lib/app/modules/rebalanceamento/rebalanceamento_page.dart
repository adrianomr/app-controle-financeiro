import 'package:controle_financeiro/app/components/button/submit/submit_widget.dart';
import 'package:controle_financeiro/app/components/fields/autocomplete_input_widget.dart';
import 'package:controle_financeiro/app/components/fields/decimal_input_widget.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    RebalanceamentoPageBloc _rebalanceamentoBloc =
        RebalanceamentoModule.to.getBloc<RebalanceamentoPageBloc>();
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Form(
            key: _formKey,
            child: ListView(children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: AutoCompleteInputWidget(
                      'Papel',
                      filter: _rebalanceamentoBloc.findAcao,
                      callback: _rebalanceamentoBloc.changePapel,
                    ),
                  ),
                  DecimalInputWidget(
                    "Percentual",
                    callback: _rebalanceamentoBloc.changePercentual,
                  ),
                  SubmitWidget(_rebalanceamentoBloc.submit),
                ],
              ),
            ])));
  }
}
