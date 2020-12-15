import 'grupo_acao.dart';

class SubGrupoAcaoChart {
  double valorTotal;
  List<GrupoAcao> grupoAcaoList;

  SubGrupoAcaoChart({
    this.valorTotal,
    this.grupoAcaoList,
  });

  SubGrupoAcaoChart.fromJson(Map<String, dynamic> json) {
    if (json['grupoAcaoList'] != null) {
      grupoAcaoList = new List<GrupoAcao>();
      json['grupoAcaoList'].forEach((v) {
        grupoAcaoList.add(new GrupoAcao.fromJson(v));
      });
    }
    valorTotal = json['valorTotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.grupoAcaoList != null) {
      data['grupoAcaoList'] =
          this.grupoAcaoList.map((v) => v.toJson()).toList();
    }
    data['valorTotal'] = this.valorTotal;
    return data;
  }
}
