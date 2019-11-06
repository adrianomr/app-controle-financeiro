import 'package:controle_financeiro/model/product.dart';

import 'base/shopping-list-base.dart';

class ShoppingList extends ShoppingListBase {
  ShoppingList({
    List<Product> product,
  }) : super(product: product);
}
