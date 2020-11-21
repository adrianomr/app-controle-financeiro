import 'package:controle_financeiro/app/components/fields/autocomplete/autocomplete_input_widget.dart';
import 'package:controle_financeiro/app/model/provento_model.dart';
import 'package:controle_financeiro/app/modules/provento/cadastro/cadastro_module.dart';
import 'package:flutter/material.dart';

import 'components/list_widget.dart';
import 'provento_module.dart';
import 'provento_page_bloc.dart';

class ProventoPage extends StatefulWidget {
  final String title;

  const ProventoPage({Key key, this.title = "Proventos"}) : super(key: key);

  @override
  _ProventoPageState createState() => _ProventoPageState();
}

class _ProventoPageState extends State<ProventoPage> {
  final _scaffoldKey = GlobalKey<FormState>();
  ProventoPageBloc _proventoBloc =
      ProventoModule.to.getBloc<ProventoPageBloc>();

  @override
  void initState() {
    _proventoBloc.buscaProventos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CadastroModule()));
          },
          child: Icon(Icons.add),
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: AutoCompleteInputWidget(
              'Pesquise por papel...',
              filter: _proventoBloc.findAcao,
              callback: _proventoBloc.changePapel,
            ),
          ),
          StreamBuilder(
            stream: _proventoBloc.proventoListBehaviorSubject.stream,
            builder: (context, snapshot) {
              List<Provento> proventoList = snapshot.data;
              if (proventoList == null) return Container();
              return ListWidget(proventoList);
            },
          ),
        ])));
  }
}
