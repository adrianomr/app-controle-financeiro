import 'package:controle_financeiro/model/product.dart';

class ShoppingList {
  List<Product> _products;
  double _total;
  static ShoppingList _singleton;

  factory ShoppingList() {
    _singleton ??= ShoppingList._internalConstructor(new List(), 0);
    return _singleton;
  }

  ShoppingList._internalConstructor(this._products, this._total);

  List<Product> get products => _products;

  double get total => _total;

  void addProduct(Product product) {
    products.add(product);
    _total += product.price;
  }
}
