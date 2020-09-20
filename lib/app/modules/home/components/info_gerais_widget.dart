import 'package:controle_financeiro/app/model/carteira_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InfoGeraisWidget extends StatelessWidget {
  Carteira carteira;

  InfoGeraisWidget(this.carteira);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).primaryColor,
        child: ExpansionTile(
          title: Row(
            children: <Widget>[
              Expanded(
                child: Row(children: <Widget>[
                  Container(
                    child: Text(
                      "Adriano",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
              ),
            ],
          ),
          trailing: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
          ),
          children: <Widget>[
            getRow("Valor Investido", getValorInvestido(context), context),
            getRow("Valor Atual", getValorAtual(context), context),
            getRow("Lucro", getLucroPrejuizo(context), context),
            getRow("Lucro (%)", getLucroPrejuizoPercentual(context), context),
          ],
        ));
  }

  Widget getRow(String title, Widget value, BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(children: <Widget>[
        Expanded(
          child: Row(children: <Widget>[
            Container(
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ]),
        ),
        value
      ]),
    );
  }

  Widget getLucroPrejuizo(BuildContext context) {
    return Text(
      "R\$ " +
          NumberFormat.currency(locale: "pt_BR", symbol: "")
              .format(carteira.lucroPrejuizo),
      style: TextStyle(color: Colors.white),
    );
  }

  Widget getValorInvestido(BuildContext context) {
    return Text(
      "R\$ " +
          NumberFormat.currency(locale: "pt_BR", symbol: "")
              .format(carteira.valorInvestido),
      style: TextStyle(color: Colors.white),
    );
  }

  Widget getValorAtual(BuildContext context) {
    return Text(
      "R\$ " +
          NumberFormat.currency(locale: "pt_BR", symbol: "")
              .format(carteira.valorAtual),
      style: TextStyle(color: Colors.white),
    );
  }

  Widget getLucroPrejuizoPercentual(BuildContext context) {
    return Text(
      NumberFormat.percentPattern()
          .format(carteira.lucroPrejuizo / carteira.valorInvestido),
      style: TextStyle(color: Colors.white),
    );
  }
}
