import 'package:controle_financeiro/model/product.dart';

import 'base/shopping-list-base.dart';

class ShoppingList extends ShoppingListBase {

  static ShoppingList _shoppingList;
  int calls = 0;

  factory ShoppingList() {
    _shoppingList ??= ShoppingList._internalConstructor();
    return _shoppingList;
  }

  ShoppingList._internalConstructor()
      : super(product: List<Product>());

  ShoppingList fromJson(Map<String, dynamic> json) {
    calls++;
    ShoppingListBase base = ShoppingListBase.fromJson(json);
    _shoppingList.product.addAll(base.product);
    return _shoppingList;
  }

  @override
  Map<String, dynamic> toJson() {
    return super.toJson();
  }

}
