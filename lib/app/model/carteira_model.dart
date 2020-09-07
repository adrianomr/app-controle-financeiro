import 'package:controle_financeiro/app/model/acao_model.dart';

class Carteira {
  List<Acao> acoes;

  Carteira({this.acoes});

  Carteira.fromJson(Map<String, dynamic> json) {
    if (json['acoes'] != null) {
      acoes = List<Acao>();
      json['acoes'].forEach((v) {
        acoes.add(Acao.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.acoes != null) {
      data['acoes'] = this.acoes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}