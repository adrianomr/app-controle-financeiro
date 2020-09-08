import 'package:controle_financeiro/app/components/charts/pie_chart/pie_chart_widget.dart';
import 'package:controle_financeiro/app/model/carteira_model.dart';
import 'package:controle_financeiro/app/modules/home/components/info_gerais_widget.dart';
import 'package:controle_financeiro/app/modules/home/components/side_bar_widget.dart';
import 'package:controle_financeiro/app/modules/home/components/tabela_acoes_widget.dart';
import 'package:controle_financeiro/app/modules/home/home_bloc.dart';
import 'package:controle_financeiro/app/modules/home/home_module.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc _homeBloc = HomeModule.to.getBloc<HomeBloc>();
  bool chartView = true;

  @override
  void initState() {
    _homeBloc.buscaCarteira();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              getInfoGerais(),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Text("Carteira"),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(chartView ? Icons.list : Icons.donut_large),
                    onPressed: () {
                      setState(() {
                        chartView = !chartView;
                      });
                    },
                  ),
                ],
              ),
              Expanded(
                child: getPanel(),
              ),
            ],
          ),
        ),
        drawer: SideBarWidget());
  }

  Widget getPanel() {
    return StreamBuilder(
      stream: _homeBloc.carteiraBehaviorSubject.stream,
      builder: (context, snapshot) {
        Carteira carteira = snapshot.data;
        if (carteira == null) return Container();
        if (chartView)
          return Container(
            child:
                PieChartWidget(_homeBloc.generateSeriesFromCarteira(carteira)),
          );
        return TabelaAcoesWidget(carteira);
      },
    );
  }

  getInfoGerais() {
    return StreamBuilder(
        stream: _homeBloc.carteiraBehaviorSubject.stream,
        builder: (context, snapshot) {
          Carteira carteira = snapshot.data;
          if (carteira == null) return Container();
          return InfoGeraisWidget(carteira);
        });
  }
}
