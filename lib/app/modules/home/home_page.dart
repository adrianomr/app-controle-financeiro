import 'package:controle_financeiro/app/components/charts/pie_chart/pie_chart_widget.dart';
import 'package:controle_financeiro/app/model/carteira_model.dart';
import 'package:controle_financeiro/app/modules/home/home_bloc.dart';
import 'package:controle_financeiro/app/modules/home/home_module.dart';
import 'package:controle_financeiro/app/modules/transacao/transacao_module.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  Widget getColumn(String text, double width) {
    return Container(
      width: width,
      child: Center(
        child: Text(text),
      ),
    );
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
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: Text("Valor Investido"),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text("Valor Atual"),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text("Lucro"),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text("Lucro (%)"),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      getValorInvestido(),
                      getValorAtual(),
                      getLucroPrejuizo(),
                      getLucroPrejuizoPercentual()
                    ],
                  ),
                ],
              ),
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
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Transação'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TransacaoModule()));
                },
              ),
              ListTile(
                title: Text('Proventos'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ));
  }

  Widget getLucroPrejuizo() {
    return StreamBuilder(
        stream: _homeBloc.carteiraBehaviorSubject.stream,
        builder: (context, snapshot) {
          Carteira carteira = snapshot.data;
          if(carteira == null)
            return Container();
          return getBadget(
              Text(
                "R\$ " +
                    NumberFormat.currency(locale: "pt_BR", symbol: "")
                        .format(carteira.lucroPrejuizo),
                style: TextStyle(color: Colors.white),
              ),
              context);
        });
  }

  Widget getValorInvestido() {
    return StreamBuilder(
        stream: _homeBloc.carteiraBehaviorSubject.stream,
        builder: (context, snapshot) {
          Carteira carteira = snapshot.data;
          if(carteira == null)
            return Container();
          return getBadget(
              Text(
                "R\$ " +
                    NumberFormat.currency(locale: "pt_BR", symbol: "")
                        .format(carteira.valorInvestido),
                style: TextStyle(color: Colors.white),
              ),
              context);
        });
  }

  Widget getValorAtual() {
    return StreamBuilder(
        stream: _homeBloc.carteiraBehaviorSubject.stream,
        builder: (context, snapshot) {
          Carteira carteira = snapshot.data;
          if(carteira == null)
            return Container();
          return getBadget(
              Text(
                "R\$ " +
                    NumberFormat.currency(locale: "pt_BR", symbol: "")
                        .format(carteira.valorAtual),
                style: TextStyle(color: Colors.white),
              ),
              context);
        });
  }

  Widget getLucroPrejuizoPercentual() {
    return StreamBuilder(
        stream: _homeBloc.carteiraBehaviorSubject.stream,
        builder: (context, snapshot) {
          Carteira carteira = snapshot.data;
          if(carteira == null)
            return Container();
          return getBadget(
              Text(
                NumberFormat.percentPattern()
                    .format(carteira.lucroPrejuizo / carteira.valorInvestido),
                style: TextStyle(color: Colors.white),
              ),
              context);
        });
  }

  getBadget(Widget children, BuildContext buildContext) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          color: Theme.of(context).primaryColor,
          height: 50,
          child: Center(child: children),
        ),
      ),
    );
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
        return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  getColumn("Papel", 70),
                  getColumn("Qtd", 30),
                  getColumn("Custo", 80),
                  getColumn("Valor", 80),
                  getColumn("Lucro", 80),
                  getColumn("(%)", 40),
                  getColumn("Cotação", 80),
                  getColumn("Preço Médio", 100),
                ],
              ),
              Column(
                children: carteira.acoes.map((acao) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      getColumn(acao.papel, 70),
                      getColumn("${acao.quantidade}", 30),
                      getColumn(
                          "R\$ " +
                              NumberFormat.currency(locale: "pt_BR", symbol: "")
                                  .format(acao.quantidade * acao.precoMedio),
                          80),
                      getColumn(
                          "R\$ " +
                              NumberFormat.currency(locale: "pt_BR", symbol: "")
                                  .format(acao.quantidade * acao.valor),
                          80),
                      getColumn(
                          "R\$ " +
                              NumberFormat.currency(locale: "pt_BR", symbol: "")
                                  .format((acao.valor - acao.precoMedio) *
                                      acao.quantidade),
                          80),
                      getColumn(
                          NumberFormat.percentPattern().format(
                              (acao.valor - acao.precoMedio) / acao.precoMedio),
                          40),
                      getColumn(
                          "R\$ " +
                              NumberFormat.currency(locale: "pt_BR", symbol: "")
                                  .format(acao.valor),
                          80),
                      getColumn(
                          "R\$ " +
                              NumberFormat.currency(locale: "pt_BR", symbol: "")
                                  .format(acao.precoMedio),
                          100),
                    ],
                  );
                }).toList(),
              )
            ]));
      },
    );
  }
}
