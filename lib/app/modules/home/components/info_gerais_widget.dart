import 'package:controle_financeiro/app/model/carteira_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InfoGeraisWidget extends StatelessWidget {
  Carteira carteira;

  InfoGeraisWidget(this.carteira);

  @override
  Widget build(BuildContext context) {
    return Column(
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
            getValorInvestido(context),
            getValorAtual(context),
            getLucroPrejuizo(context),
            getLucroPrejuizoPercentual(context)
          ],
        ),
      ],
    );
  }

  Widget getLucroPrejuizo(BuildContext context) {
    return getBadget(
        Text(
          "R\$ " +
              NumberFormat.currency(locale: "pt_BR", symbol: "")
                  .format(carteira.lucroPrejuizo),
          style: TextStyle(color: Colors.white),
        ),
        context);
  }

  Widget getValorInvestido(BuildContext context) {
    return getBadget(
        Text(
          "R\$ " +
              NumberFormat.currency(locale: "pt_BR", symbol: "")
                  .format(carteira.valorInvestido),
          style: TextStyle(color: Colors.white),
        ),
        context);
  }

  Widget getValorAtual(BuildContext context) {
    return getBadget(
        Text(
          "R\$ " +
              NumberFormat.currency(locale: "pt_BR", symbol: "")
                  .format(carteira.valorAtual),
          style: TextStyle(color: Colors.white),
        ),
        context);
  }

  Widget getLucroPrejuizoPercentual(BuildContext context) {
    return getBadget(
        Text(
          NumberFormat.percentPattern()
              .format(carteira.lucroPrejuizo / carteira.valorInvestido),
          style: TextStyle(color: Colors.white),
        ),
        context);
  }

  getBadget(Widget children, BuildContext context) {
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
}
