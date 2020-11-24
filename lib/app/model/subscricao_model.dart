class Subscricao {
  int id;
  String papel;
  int quantidade;
  double valor;
  int idUsuario;
  int idCorretora;
  DateTime data;

  Subscricao(
      {this.id,
      this.papel,
      this.quantidade,
      this.valor,
      this.idUsuario,
      this.idCorretora,
      this.data});

  Subscricao.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    papel = json['papel'];
    quantidade = json['quantidade'];
    valor = json['valor'];
    idUsuario = json['idUsuario'];
    idCorretora = json['idCorretora'];
    data = DateTime.parse(json['data']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['papel'] = this.papel;
    data['quantidade'] = this.quantidade;
    data['valor'] = this.valor;
    data['idUsuario'] = this.idUsuario;
    data['idCorretora'] = this.idCorretora;
    data['data'] = this.data.toIso8601String();
    return data;
  }
}
