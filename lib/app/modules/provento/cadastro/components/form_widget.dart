import 'package:controle_financeiro/app/components/button/submit/submit_widget.dart';
import 'package:controle_financeiro/app/components/fields/autocomplete/autocomplete_input_widget.dart';
import 'package:controle_financeiro/app/components/fields/currency_input_widget.dart';
import 'package:controle_financeiro/app/components/fields/date_input_widget.dart';
import 'package:controle_financeiro/app/modules/provento/cadastro/cadastro_module.dart';
import 'package:controle_financeiro/app/modules/provento/cadastro/cadastro_page_bloc.dart';
import 'package:flutter/cupertino.dart';

class FormWidget extends StatefulWidget {
  @override
  _FormWidgetState createState() {
    return _FormWidgetState();
  }
}

class _FormWidgetState extends State<FormWidget> {
  CadastroPageBloc cadastroPageBloc =
      CadastroModule.to.getBloc<CadastroPageBloc>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cadastroPageBloc.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: AutoCompleteInputWidget(
              'Selecione a ação',
              filter: cadastroPageBloc.findAcao,
              callback: cadastroPageBloc.changePapel,
            ),
          ),
          DateInputWidget(
            'Data',
            cadastroPageBloc.provento.data,
            callback: (data) {
              setState(() {
                cadastroPageBloc.changeData(data);
              });
            },
          ),
          CurrencyInputWidget(
            "Valor unitário",
            callback: cadastroPageBloc.changeValor,
          ),
          SubmitWidget(cadastroPageBloc.submit),
        ],
      ),
    );
  }
}
