import 'package:controle_financeiro/app/model/usuario_model.dart';

import 'acao_model.dart';

class Rebalanceamento {
  int id;
  Acao acao;
  Usuario usuario;
  double percentual;

  Rebalanceamento({this.id, this.acao, this.usuario, this.percentual});

  Rebalanceamento.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    acao = json['acao'] != null ? new Acao.fromJson(json['acao']) : null;
    usuario =
        json['usuario'] != null ? new Usuario.fromJson(json['usuario']) : null;
    percentual = json['percentual'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.acao != null) {
      data['acao'] = this.acao.toJson();
    }
    if (this.usuario != null) {
      data['usuario'] = this.usuario.toJson();
    }
    data['percentual'] = this.percentual;
    return data;
  }
}
