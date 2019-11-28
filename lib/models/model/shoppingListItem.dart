import 'package:json_annotation/json_annotation.dart';

import "product.dart";

part 'shoppingListItem.g.dart';

@JsonSerializable()
class ShoppingListItem {
  ShoppingListItem();

  num id;
  Product product;

  factory ShoppingListItem.fromJson(Map<String, dynamic> json) =>
      _$ShoppingListItemFromJson(json);

  Map<String, dynamic> toJson() => _$ShoppingListItemToJson(this);
}
