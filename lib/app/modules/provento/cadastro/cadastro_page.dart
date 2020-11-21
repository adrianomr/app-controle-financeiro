import 'package:controle_financeiro/app/modules/provento/cadastro/cadastro_module.dart';
import 'package:flutter/material.dart';

import 'cadastro_page_bloc.dart';
import 'components/form_widget.dart';

class CadastroPage extends StatefulWidget {
  final String title;

  const CadastroPage({Key key, this.title = "Transação"}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _scaffoldKey = GlobalKey<FormState>();
  CadastroPageBloc _cadastroBloc =
      CadastroModule.to.getBloc<CadastroPageBloc>();

  @override
  void initState() {
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
            child: Column(children: <Widget>[FormWidget()])));
  }
}
