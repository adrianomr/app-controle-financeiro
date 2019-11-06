import 'package:controle_financeiro/model/product.dart';

import 'base/shopping-list-base.dart';

class ShoppingList extends ShoppingListBase {

  static ShoppingList _shoppingList;

  factory ShoppingList({List<Product> product}) {
    _shoppingList ??= ShoppingList._internalConstructor(product: product);
    return _shoppingList;
  }

  ShoppingList._internalConstructor({List<Product> product})
      : super(product: product);

  ShoppingList fromJson(Map<String, dynamic> json) {
    ShoppingListBase base = ShoppingListBase.fromJson(json);
    _shoppingList.product.addAll(base.product);
    _shoppingList;
  }

  @override
  Map<String, dynamic> toJson() {
    return super.toJson();
  }

}
