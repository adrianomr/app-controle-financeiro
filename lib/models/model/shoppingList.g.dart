// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoppingList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingList _$ShoppingListFromJson(Map<String, dynamic> json) {
  return ShoppingList()
    ..id = json['id'] as num
    ..sysUser = json['sysUser'] as Map<String, dynamic>
    ..description = json['description'] as String
    ..value = json['value'] as num
    ..shoppingListItems = (json['shoppingListItems'] as List)
        ?.map((e) => e == null
            ? null
            : ShoppingListItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ShoppingListToJson(ShoppingList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sysUser': instance.sysUser,
      'description': instance.description,
      'value': instance.value,
      'shoppingListItems': instance.shoppingListItems
    };
