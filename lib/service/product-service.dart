import 'dart:io';

import 'package:controle_financeiro/model/base/product-base.dart';
import 'package:controle_financeiro/model/product.dart';
import 'package:http/http.dart' as http;

Future<String> getShoppingList() async {
  final response = await http
      .get('https://ar-controle-financeiro.herokuapp.com/shopping-item');
  print('shopping itens:' + response.body);
  return response.body;
}

Future<Product> createProduct(Product product) async {
  final response = await http.post(
      'https://ar-controle-financeiro.herokuapp.com/shopping-item',
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: product.productToJson());
  return Product.fromBase(productBaseFromJson(response.body));
}
