class Acao {
  int id;
  String papel;
  String codigoBdi;
  int tipoMercado;
  String nomeEmpresa;
  int quantidade;
  double valor;

  Acao(
      {this.id,
        this.papel,
        this.codigoBdi,
        this.tipoMercado,
        this.nomeEmpresa,
        this.quantidade,
        this.valor});

  Acao.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    papel = json['papel'];
    codigoBdi = json['codigoBdi'];
    tipoMercado = json['tipoMercado'];
    nomeEmpresa = json['nomeEmpresa'];
    quantidade = json['quantidade'];
    valor = json['valor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['papel'] = this.papel;
    data['codigoBdi'] = this.codigoBdi;
    data['tipoMercado'] = this.tipoMercado;
    data['nomeEmpresa'] = this.nomeEmpresa;
    data['quantidade'] = this.quantidade;
    data['valor'] = this.valor;
    return data;
  }
}