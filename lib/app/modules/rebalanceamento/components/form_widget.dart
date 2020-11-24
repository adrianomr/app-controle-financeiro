import 'package:controle_financeiro/app/components/button/submit/submit_widget.dart';
import 'package:controle_financeiro/app/components/fields/autocomplete/autocomplete_input_widget.dart';
import 'package:controle_financeiro/app/components/fields/decimal_input_widget.dart';
import 'package:flutter/material.dart';

import '../rebalanceamento_module.dart';
import '../rebalanceamento_page_bloc.dart';

class FormWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FormWidgetState();
  }
}

class _FormWidgetState extends State<FormWidget> {
  RebalanceamentoPageBloc _rebalanceamentoBloc =
      RebalanceamentoModule.to.getBloc<RebalanceamentoPageBloc>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _rebalanceamentoBloc.formKey,
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
            "Nota",
            callback: _rebalanceamentoBloc.changeNota,
          ),
          Switch(
            value: _rebalanceamentoBloc.digitarPercentual,
            onChanged: (value) {
              setState(() {
                _rebalanceamentoBloc.changeDigitarPercentual(value);
              });
            },
          ),
          (_rebalanceamentoBloc.digitarPercentual
              ? DecimalInputWidget(
                  "Percentual",
                  callback: _rebalanceamentoBloc.changePercentual,
                )
              : Container()),
          SubmitWidget(_rebalanceamentoBloc.submit),
        ],
      ),
    );
  }
}
