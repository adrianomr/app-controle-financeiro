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
        print('data' + jsonData);
        _shoppingList =
            ShoppingList.fromJson(json.decode(jsonData)['content'][0]);
        print('obj from json' + _shoppingList.toJson().toString());
      this.notifyListeners();
    });
  }

  List<ShoppingListItem> getItens() {
    if (shoppingList.shoppingListItems == null)
      shoppingList.shoppingListItems = List();
    return shoppingList.shoppingListItems;
  }
  addProduct() {
    ShoppingListItem item = new ShoppingListItem();
    item.product = _editableProductBloc.product;
    getItens().add(item);
    _editableProductBloc.addProduct();
    print("shopping list -> " + _shoppingList.toJson().toString());
    notifyListeners();
  }

  double getTotal() {
    return 0;
  }

  ShoppingList get shoppingList => _shoppingList;

  int getCountItens() {
    return getItens().length;
  }

  Product getProduct(int index) {
    return getItens()[index].product;
  }

  void removeProduct(int index) {
    getItens().removeAt(index);
    notifyListeners();
  }

  Product getEditableProduct() {
    return _editableProductBloc.product;
  }

  Product editableProductChange(String description) {
    _editableProductBloc.editProduct(description);
  }
}
