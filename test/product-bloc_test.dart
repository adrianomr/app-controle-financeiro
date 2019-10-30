import 'package:controle_financeiro/bloc/shopping-list-bloc.dart';
import 'package:controle_financeiro/model/product.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ShoppingListBloc shoppingListBloc = ShoppingListBloc();
  shoppingListBloc.addProduct(Product("", "", 10));
  // Verify that our counter starts at 0.
  expect(shoppingListBloc.getTotal(), 10);
}
