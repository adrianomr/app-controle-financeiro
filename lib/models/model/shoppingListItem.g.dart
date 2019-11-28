// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoppingListItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingListItem _$ShoppingListItemFromJson(Map<String, dynamic> json) {
  return ShoppingListItem()
    ..id = json['id'] as num
    ..product = json['product'] == null
        ? null
        : Product.fromJson(json['product'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ShoppingListItemToJson(ShoppingListItem instance) =>
    <String, dynamic>{'id': instance.id, 'product': instance.product};
