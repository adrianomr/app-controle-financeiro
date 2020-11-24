import 'package:controle_financeiro/app/components/button/submit/submit_widget.dart';
import 'package:controle_financeiro/app/components/fields/autocomplete/autocomplete_input_widget.dart';
import 'package:controle_financeiro/app/components/fields/currency_input_widget.dart';
import 'package:controle_financeiro/app/components/fields/date_input_widget.dart';
import 'package:controle_financeiro/app/components/fields/number_input_widget.dart';
import 'package:flutter/cupertino.dart';

import '../subscricao_module.dart';
import '../subscricao_page_bloc.dart';

class FormWidget extends StatefulWidget {
  @override
  _FormWidgetState createState() {
    return _FormWidgetState();
  }
}

class _FormWidgetState extends State<FormWidget> {
  SubscricaoPageBloc _subscricaoBloc =
      SubscricaoModule.to.getBloc<SubscricaoPageBloc>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _subscricaoBloc.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: AutoCompleteInputWidget(
              'Corretora',
              filter: _subscricaoBloc.findCorretora,
              callback: _subscricaoBloc.changeCorretora,
            ),
          ),
          DateInputWidget(
            'Data',
            _subscricaoBloc.subscricao.data,
            callback: (data) {
              setState(() {
                _subscricaoBloc.changeData(data);
              });
            },
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: AutoCompleteInputWidget(
              'Papel',
              filter: _subscricaoBloc.findAcao,
              callback: _subscricaoBloc.changePapel,
            ),
          ),
          NumberInputWidget(
            "Quantidade",
            callback: _subscricaoBloc.changeQuantidade,
          ),
          CurrencyInputWidget(
            "Preço",
            callback: _subscricaoBloc.changeValor,
          ),
          SubmitWidget(_subscricaoBloc.submit),
        ],
      ),
    );
  }
}
