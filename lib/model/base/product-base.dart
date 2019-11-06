// To parse this JSON data, do
//
//     final productBase = productBaseFromJson(jsonString);

import 'dart:convert';

ProductBase productBaseFromJson(String str) =>
    ProductBase.fromJson(json.decode(str));

String productBaseToJson(ProductBase data) => json.encode(data.toJson());

class ProductBase {
  int id;
  String descricao;
  double valor;

  ProductBase({
    this.id,
    this.descricao,
    this.valor,
  });

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
