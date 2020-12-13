import 'package:controle_financeiro/app/components/button/submit/submit_widget.dart';
import 'package:controle_financeiro/app/components/fields/autocomplete/autocomplete_input_widget.dart';
import 'package:controle_financeiro/app/components/fields/decimal_input_widget.dart';
import 'package:controle_financeiro/app/components/fields/text_input_widget.dart';
import 'package:controle_financeiro/app/model/grupo_acao.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../cadastro_module.dart';
import '../cadastro_page_bloc.dart';
import 'list_widget.dart';

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
          TextInputWidget(
            "Nome do grupo",
            callback: cadastroPageBloc.changeNome,
          ),
          DecimalInputWidget(
            "Nota",
            callback: cadastroPageBloc.changeNota,
          ),
          Switch(
            value: cadastroPageBloc.digitarPercentual,
            onChanged: (value) {
              setState(() {
                cadastroPageBloc.changeDigitarPercentual(value);
              });
            },
          ),
          (cadastroPageBloc.digitarPercentual
              ? DecimalInputWidget(
                  "Percentual",
                  callback: cadastroPageBloc.changePercentual,
                )
              : Container()),
          Padding(
            padding: EdgeInsets.all(10),
            child: AutoCompleteInputWidget(
              'Selecione a ação',
              filter: cadastroPageBloc.findAcao,
              callback: cadastroPageBloc.changePapel,
            ),
          ),
          SubmitWidget(cadastroPageBloc.submit),
          StreamBuilder(
            stream: cadastroPageBloc.grupoAcaoBehaviorSubject.stream,
            builder: (context, snapshot) {
              GrupoAcao grupoAcao = snapshot.data;
              if (grupoAcao == null) return Container();
              return ListWidget(grupoAcao.acaoList);
            },
          ),
        ],
      ),
    );
  }
}
