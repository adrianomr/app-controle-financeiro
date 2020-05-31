import 'package:controle_financeiro/app/components/button/submit/submit_widget.dart';
import 'package:controle_financeiro/app/components/fields/autocomplete_input_widget.dart';
import 'package:controle_financeiro/app/components/fields/button_group_input_widget.dart';
import 'package:controle_financeiro/app/components/fields/currency_input_widget.dart';
import 'package:controle_financeiro/app/components/fields/date_input_widget.dart';
import 'package:controle_financeiro/app/components/fields/number_input_widget.dart';
import 'package:controle_financeiro/app/modules/transacao//transacao_module.dart';
import 'package:controle_financeiro/app/modules/transacao/transacao_bloc.dart';
import 'package:flutter/material.dart';

class TransacaoPage extends StatefulWidget {
  final String title;

  const TransacaoPage({Key key, this.title = "Transação"}) : super(key: key);

  @override
  _TransacaoPageState createState() => _TransacaoPageState();
}

class _TransacaoPageState extends State<TransacaoPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TransacaoBloc _acaoBloc = TransacaoModule.to.getBloc<TransacaoBloc>();
    List<String> suggestions = [
      "BCFF11",
      "ITSA4",
      "B3SA3",
      "ITUB3",
      "WIZS3",
      "XPLG11",
    ];
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
                  DateInputWidget(),
                  AutoCompleteInputWidget(suggestions),
                  ButtonGroupnInputWidget(),
                  NumberInputWidget("Quantidade"),
                  CurrencyInputWidget("Preço"),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: SubmitWidget(() => print('submit')),
                  ),
                ],
              ),
            ])));
  }
}
