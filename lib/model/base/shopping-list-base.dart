// To parse this JSON data, do
//
//     final shoppingListBase = shoppingListBaseFromJson(jsonString);

import 'dart:convert';

import '../product.dart';

ShoppingListBase shoppingListBaseFromJson(String str) =>
    ShoppingListBase.fromJson(json.decode(str));

String shoppingListBaseToJson(ShoppingListBase data) =>
    json.encode(data.toJson());

class ShoppingListBase {
  List<Product> product;

  ShoppingListBase({
    this.product,
  });

  factory ShoppingListBase.fromJson(Map<String, dynamic> json) =>
      ShoppingListBase(
        product: List<Product>.from(
            json["product"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "product": List<dynamic>.from(product.map((x) => x.toJson())),
  };
}
