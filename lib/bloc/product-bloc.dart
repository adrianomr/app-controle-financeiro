import 'package:controle_financeiro/model/product.dart';
import 'package:controle_financeiro/service/product-service.dart';

class ProductBloc {
  Product product;

  ProductBloc() {
    newProduct();
  }

  Product editProduct(String description) {
    product.descricao = description;
  }

  newProduct() {
    product = new Product(descricao: "");
  }

  addProduct() {
    createProduct(product);
    print("added item -> " + product.toJson().toString());
    newProduct();
  }

}
