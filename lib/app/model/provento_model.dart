class Provento {
  DateTime data;
  int id;
  String papel;
  double valor;

  Provento({this.data, this.id, this.papel, this.valor});

  Provento.fromJson(Map<String, dynamic> json) {
    data = DateTime.parse(json['data']);
    id = json['id'];
    papel = json['papel'];
    valor = json['valor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data.toIso8601String();
    data['id'] = this.id;
    data['papel'] = this.papel;
    data['valor'] = this.valor;
    return data;
  }
}
