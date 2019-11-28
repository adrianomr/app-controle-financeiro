import 'package:json_annotation/json_annotation.dart';

import "shoppingListItem.dart";

part 'shoppingList.g.dart';

@JsonSerializable()
class ShoppingList {
  ShoppingList();

  num id;
  Map<String, dynamic> sysUser;
  String description;
  num value;
  List<ShoppingListItem> shoppingListItems;

  factory ShoppingList.fromJson(Map<String, dynamic> json) =>
      _$ShoppingListFromJson(json);

  Map<String, dynamic> toJson() => _$ShoppingListToJson(this);
}
