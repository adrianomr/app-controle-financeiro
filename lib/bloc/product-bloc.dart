import 'package:controle_financeiro/models/model/product.dart';
import 'package:controle_financeiro/service/product-service.dart';

class ProductBloc {
  Product product;

  ProductBloc() {
    newProduct();
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

}
