import 'package:controle_financeiro/app/components/button/submit/submit_widget.dart';
import 'package:controle_financeiro/app/components/fields/autocomplete_input_widget.dart';
import 'package:controle_financeiro/app/components/fields/button_group_input_widget.dart';
import 'package:controle_financeiro/app/components/fields/currency_input_widget.dart';
import 'package:controle_financeiro/app/components/fields/date_input_widget.dart';
import 'package:controle_financeiro/app/components/fields/number_input_widget.dart';
import 'package:flutter/cupertino.dart';

import '../transacao_module.dart';
import '../transacao_page_bloc.dart';

class FormWidget extends StatefulWidget {
  @override
  _FormWidgetState createState() {
    return _FormWidgetState();
  }
}

class _FormWidgetState extends State<FormWidget> {
  TransacaoPageBloc _transacaoBloc =
      TransacaoModule.to.getBloc<TransacaoPageBloc>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _transacaoBloc.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DateInputWidget(
            'Data',
            callback: _transacaoBloc.changeData,
          ),
          ButtonGroupnInputWidget(
            {'Compra': true, 'Venda': false},
            _transacaoBloc.changeTipoTransacao,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: AutoCompleteInputWidget(
              'Papel',
              filter: _transacaoBloc.findAcao,
              callback: _transacaoBloc.changePapel,
            ),
          ),
          NumberInputWidget(
            "Quantidade",
            callback: _transacaoBloc.changeQuantidade,
          ),
          CurrencyInputWidget(
            "Preço",
            callback: _transacaoBloc.changeValor,
          ),
          SubmitWidget(_transacaoBloc.submit),
        ],
      ),
    );
  }
}
