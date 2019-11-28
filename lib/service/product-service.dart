import 'dart:convert';
import 'dart:io';

import 'package:controle_financeiro/models/model/product.dart';
import 'package:http/http.dart' as http;

Future<String> getProducts() async {
  final response = await http
      .get('https://ar-controle-financeiro.herokuapp.com/product');
  return response.body;
}

Future<Product> createProduct(Product product) async {
  final response = await http.post(
      'https://ar-controle-financeiro.herokuapp.com/product',
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: product.toJson());
  return Product.fromJson(json.decode(response.body));
}
