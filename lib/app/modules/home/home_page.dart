import 'package:controle_financeiro/app/components/charts/pie_chart/pie_chart_widget.dart';
import 'package:controle_financeiro/app/modules/transacao/transacao_module.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PieChartWidget.withRandomData()
      ,
      drawer: Drawer(child:ListView(
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
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TransacaoModule()));

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
}
