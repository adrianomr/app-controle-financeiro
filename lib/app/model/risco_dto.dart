import 'package:controle_financeiro/app/model/acao_model.dart';

class RiscoDto {
  double totalRiscoBaixo;
  double totalRiscoMedio;
  double totalRiscoAlto;
  double valorTotal;
  List<Acao> acaoList;
  double riscoMedioPercentual;
  double riscoBaixoPercentual;
  double riscoAltoPercentual;

  RiscoDto(
      {this.totalRiscoBaixo,
      this.totalRiscoMedio,
      this.totalRiscoAlto,
      this.valorTotal,
      this.acaoList,
      this.riscoMedioPercentual,
      this.riscoBaixoPercentual,
      this.riscoAltoPercentual});

  RiscoDto.fromJson(Map<String, dynamic> json) {
    totalRiscoBaixo = json['totalRiscoBaixo'];
    totalRiscoMedio = json['totalRiscoMedio'];
    totalRiscoAlto = json['totalRiscoAlto'];
    valorTotal = json['valorTotal'];
    if (json['acaoList'] != null) {
      acaoList = new List<Acao>();
      json['acaoList'].forEach((v) {
        acaoList.add(new Acao.fromJson(v));
      });
    }
    riscoMedioPercentual = json['riscoMedioPercentual'];
    riscoBaixoPercentual = json['riscoBaixoPercentual'];
    riscoAltoPercentual = json['riscoAltoPercentual'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalRiscoBaixo'] = this.totalRiscoBaixo;
    data['totalRiscoMedio'] = this.totalRiscoMedio;
    data['totalRiscoAlto'] = this.totalRiscoAlto;
    data['valorTotal'] = this.valorTotal;
    if (this.acaoList != null) {
      data['acaoList'] = this.acaoList.map((v) => v.toJson()).toList();
    }
    data['riscoMedioPercentual'] = this.riscoMedioPercentual;
    data['riscoBaixoPercentual'] = this.riscoBaixoPercentual;
    data['riscoAltoPercentual'] = this.riscoAltoPercentual;
    return data;
  }
}
