import 'package:flutter/material.dart';

import 'components/form_widget.dart';

class CadastroPage extends StatefulWidget {
  final String title;

  const CadastroPage({Key key, this.title = "Grupo de Ações"})
      : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _scaffoldKey = GlobalKey<FormState>();

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
