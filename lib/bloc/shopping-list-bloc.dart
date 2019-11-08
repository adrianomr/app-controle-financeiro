import 'dart:convert';

import 'package:controle_financeiro/bloc/product-bloc.dart';
import 'package:controle_financeiro/model/product.dart';
import 'package:controle_financeiro/model/shopping-list.dart';
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
      if (_shoppingList.calls == 0) {
        jsonData = jsonData.replaceAll("content", "product");
        print('data' + jsonData);
        _shoppingList.fromJson(json.decode(jsonData));
      }
      this.notifyListeners();
    });
  }

  addProduct() {
    shoppingList.product.add(_editableProductBloc.product);
    _editableProductBloc.addProduct();
    print("shopping list -> " + _shoppingList.toJson().toString());
    notifyListeners();
  }

  double getTotal() {
    return 0;
  }

  ShoppingList get shoppingList => _shoppingList;

  int getCountItens() {
    return shoppingList.product.length;
  }

  Product getProduct(int index) {
    return shoppingList.product[index];
  }

  void removeProduct(int index) {
    shoppingList.product.removeAt(index);
    notifyListeners();
  }

  Product getEditableProduct() {
    return _editableProductBloc.product;
  }

  Product editableProductChange(String description) {
    _editableProductBloc.editProduct(description);
  }
}
