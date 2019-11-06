// To parse this JSON data, do
//
//     final productBase = productBaseFromJson(jsonString);

import 'dart:convert';

class ProductBase {
  int id;
  String descricao;
  int valor;

  ProductBase({
    this.id,
    this.descricao,
    this.valor,
  });

  factory ProductBase.fromRawJson(String str) =>
      ProductBase.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductBase.fromJson(Map<String, dynamic> json) => ProductBase(
        id: json["id"],
        descricao: json["descricao"],
        valor: json["valor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "descricao": descricao,
        "valor": valor,
      };
}
