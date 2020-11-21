import 'package:controle_financeiro/app/components/button/submit/submit_widget.dart';
import 'package:controle_financeiro/app/components/fields/autocomplete/autocomplete_input_widget.dart';
import 'package:controle_financeiro/app/components/fields/decimal_input_widget.dart';
import 'package:controle_financeiro/app/model/rebalanceamento_model.dart';
import 'package:controle_financeiro/app/modules/rebalanceamento/rebalanceamento_module.dart';
import 'package:controle_financeiro/app/modules/rebalanceamento/rebalanceamento_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
              Form(
                key: _formKey,
                child: Column(
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
              ),
              StreamBuilder(
                stream: _rebalanceamentoBloc
                    .rebalanceamentoListBehaviorSubject.stream,
                builder: (context, snapshot) {
                  List<Rebalanceamento> rebalanceamentoList = snapshot.data;
                  if (rebalanceamentoList == null) return Container();
                  return Column(
                    children: rebalanceamentoList
                        .map((rebalanceamento) => getRow(rebalanceamento))
                        .toList(),
                  );
                },
              )
            ],
          ),
        ));
  }

  Widget getRow(Rebalanceamento rebalanceamento) {
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
      key: Key(rebalanceamento.id.toString()),
      onDismissed: (direction) {
        _rebalanceamentoBloc.delete(rebalanceamento);
      },
      child: ListTile(
        title: Text(rebalanceamento.acao.papel),
        trailing: Text(NumberFormat.decimalPercentPattern(decimalDigits: 2)
            .format(rebalanceamento.percentual / 100)),
      ),
    );
  }
}
