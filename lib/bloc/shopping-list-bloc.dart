import 'package:controle_financeiro/model/product.dart';
import 'package:controle_financeiro/model/shopping-list.dart';
import 'package:controle_financeiro/service/shopping-list-service.dart';

class ShoppingListBloc {
  ShoppingList _shoppingList;

  ShoppingListBloc() {
    getPost();
    _shoppingList = ShoppingList();
  }

  addProduct(Product product) {
    shoppingList.addProduct(product);
    print("added item -> " + product.id);
    print("total -> " + getTotal().toString());
  }

  double getTotal() {
    return shoppingList.total;
  }

  ShoppingList get shoppingList => _shoppingList;
}
