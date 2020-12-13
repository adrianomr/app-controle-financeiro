import 'package:controle_financeiro/app/model/acao_model.dart';

class GrupoAcao {
  int id;
  List<Acao> acaoList;
  List<GrupoAcao> subgrupoList;
  String nome;
  double percentual;
  double valorInvestido;
  double nota;
  int idUsuario;

  GrupoAcao(
      {this.acaoList,
      this.subgrupoList,
      this.id,
      this.nome,
      this.percentual,
      this.valorInvestido,
      this.nota,
      this.idUsuario});

  GrupoAcao.fromJson(Map<String, dynamic> json) {
    if (json['acaoList'] != null) {
      acaoList = new List<Acao>();
      json['acaoList'].forEach((v) {
        acaoList.add(new Acao.fromJson(v));
      });
    }
    if (json['subgrupoList'] != null) {
      subgrupoList = new List<GrupoAcao>();
      json['subgrupoList'].forEach((v) {
        subgrupoList.add(new GrupoAcao.fromJson(v));
      });
    }
    id = json['id'];
    nome = json['nome'];
    percentual = json['percentual'];
    valorInvestido = json['valorInvestido'];
    nota = json['nota'];
    idUsuario = json['idUsuario'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.acaoList != null) {
      data['acaoList'] = this.acaoList.map((v) => v.toJson()).toList();
    }
    if (this.subgrupoList != null) {
      data['subgrupoList'] = this.subgrupoList.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['percentual'] = this.percentual;
    data['valorInvestido'] = this.valorInvestido;
    data['nota'] = this.nota;
    data['idUsuario'] = this.idUsuario;
    return data;
  }
}
