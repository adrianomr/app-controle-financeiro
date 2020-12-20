import 'package:controle_financeiro/app/model/carteira_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TabelaAcoesWidget extends StatelessWidget {
  Carteira carteira;

  TabelaAcoesWidget(this.carteira);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
  }

  Widget getColumn(String text, double width) {
    return Container(
      width: width,
      child: Center(
        child: Text(text),
      ),
    );
  }
}
