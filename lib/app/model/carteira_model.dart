import 'package:controle_financeiro/app/model/acao_model.dart';

class Carteira {
  double valorInvestido;
  double valorAtual;
  double lucroPrejuizo;
  List<Acao> acoes;

  Carteira({this.acoes});

  Carteira.fromJson(Map<String, dynamic> json) {
    valorInvestido = json['valorInvestido'];
    valorAtual = json['valorAtual'];
    lucroPrejuizo = json['lucroPrejuizo'];
    if (json['acoes'] != null) {
      acoes = List<Acao>();
      json['acoes'].forEach((v) {
        acoes.add(Acao.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['valorInvestido'] = this.valorInvestido;
    data['valorAtual'] = this.valorAtual;
    data['lucroPrejuizo'] = this.lucroPrejuizo;
    if (this.acoes != null) {
      data['acoes'] = this.acoes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}