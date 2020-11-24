

class Rebalanceamento {
  int id;
  String papel;
  int idUsuario;
  double percentual;
  double nota;

  Rebalanceamento({this.id, this.papel, this.idUsuario, this.percentual});

  Rebalanceamento.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    papel = json['papel'];
    idUsuario = json['idUsuario'];
    percentual = json['percentual'];
    nota = json['nota'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['papel'] = this.papel;
    data['idUsuario'] = this.idUsuario;
    data['percentual'] = this.percentual;
    data['nota'] = this.nota;
    return data;
  }
}
