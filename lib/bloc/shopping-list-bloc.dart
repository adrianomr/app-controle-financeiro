import 'dart:convert';

import 'package:controle_financeiro/bloc/product-bloc.dart';
import 'package:controle_financeiro/models/model/product.dart';
import 'package:controle_financeiro/models/model/shoppingList.dart';
import 'package:controle_financeiro/models/model/shoppingListItem.dart';
import 'package:controle_financeiro/service/shopping-list-service.dart';
import 'package:flutter/foundation.dart';

class ShoppingListBloc extends ChangeNotifier {
  ShoppingList _shoppingList;
  ProductBloc _editableProductBloc;

  ShoppingListBloc() {
    _editableProductBloc = new ProductBloc();
    _shoppingList = ShoppingList();
    getShoppingList().then((String jsonData) {
//        descomentar quando ajsutar o backend
//        _shoppingList.fromJson(json.decode(jsonData));
//      if (_shoppingList.calls == 0) {
      jsonData = jsonData.replaceAll("content", "product.json");
        print('data' + jsonData);
      _shoppingList = ShoppingList.fromJson(json.decode(jsonData));
//      }
      this.notifyListeners();
    });
  }

  addProduct() {
    ShoppingListItem item = new ShoppingListItem();
    item.product = _editableProductBloc.product;
    shoppingList.shoppingListItems.add(item);
    _editableProductBloc.addProduct();
    print("shopping list -> " + _shoppingList.toJson().toString());
    notifyListeners();
  }

  double getTotal() {
    return 0;
  }

  ShoppingList get shoppingList => _shoppingList;

  int getCountItens() {
    return shoppingList.shoppingListItems.length;
  }

  Product getProduct(int index) {
    return shoppingList.shoppingListItems[index].product;
  }

  void removeProduct(int index) {
    shoppingList.shoppingListItems.removeAt(index);
    notifyListeners();
  }

  Product getEditableProduct() {
    return _editableProductBloc.product;
  }

  Product editableProductChange(String description) {
    _editableProductBloc.editProduct(description);
  }
}
