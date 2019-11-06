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
    if (_shoppingList == null) {
      getShoppingList();
      _shoppingList = ShoppingList(product: new List());
    }
  }

  addProduct() {
    shoppingList.product.add(_editableProductBloc.product);
    print("added item -> " + _editableProductBloc.product.toJson().toString());
    print("shopping list -> " + _shoppingList.toJson().toString());
    _editableProductBloc.newProduct();
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