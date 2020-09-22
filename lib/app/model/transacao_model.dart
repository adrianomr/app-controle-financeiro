class Transacao {
  int id;
  int idUsuario;
  String papel;
  double valor;
  DateTime data;
  int quantidade;

  Transacao(
      {this.idUsuario, this.papel, this.valor, this.data, this.quantidade});

  Transacao.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idUsuario = json['idUsuario'];
    papel = json['papel'];
    valor = json['valor'];
    data = DateTime.parse(json['data']);
    quantidade = json['quantidade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idUsuario'] = this.idUsuario;
    data['papel'] = this.papel;
    data['valor'] = this.valor;
    data['data'] = this.data.toIso8601String();
    data['quantidade'] = this.quantidade;
    return data;
  }
}
