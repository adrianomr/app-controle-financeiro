import 'package:controle_financeiro/app/modules/provento/provento_module.dart';
import 'package:controle_financeiro/app/modules/rebalanceamento/rebalanceamento_module.dart';
import 'package:controle_financeiro/app/modules/subscricao/subscricao_module.dart';
import 'package:controle_financeiro/app/modules/transacao/transacao_module.dart';
import 'package:flutter/material.dart';

class SideBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Adriano Rodrigues'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Transação'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TransacaoModule()));
            },
          ),
          ListTile(
            title: Text('Rebalanceamento'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => RebalanceamentoModule()));
            },
          ),
          ListTile(
            title: Text('Proventos'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ProventoModule()));
            },
          ),
          ListTile(
            title: Text('Subscrições'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SubscricaoModule()));
            },
          ),
        ],
      ),
    );
  }
}
