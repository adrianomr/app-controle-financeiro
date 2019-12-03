import 'dart:convert';

import 'package:controle_financeiro/models/model/product.dart';
import 'package:controle_financeiro/service/product-service.dart';
import 'package:controle_financeiro/service/product-service.dart' as productService;
import 'package:flutter/foundation.dart';


class ProductBloc extends ChangeNotifier {
  Product product;
  List<Product> products;

  ProductBloc() {
    newProduct();
    productService.getProducts().then((String jsonData) {
      print('data' + jsonData);
      final parsed = json.decode(jsonData)['content'];
      this.products =
          parsed.map<Product>((json) => Product.fromJson(json)).toList();
      notifyListeners();
    });
  }

  Product editProduct(String description) {
    product.description = description;
  }

  newProduct() {
    product = new Product();
    product.description = '';
  }

  addProduct() {
    createProduct(product);
    print("added item -> " + product.toJson().toString());
    newProduct();
  }

  List<Product> getProducts() {
    if (products == null) {
      products = List();
    }
    print(products.length);
    return products;
  }

}
