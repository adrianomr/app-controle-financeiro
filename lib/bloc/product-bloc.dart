import 'package:controle_financeiro/model/product.dart';

class ProductBloc {
  Product product;

  ProductBloc() {
    newProduct();
  }

  Product editProduct(String description) {
    product.descricao = description;
  }

  void newProduct() {
    product = new Product(descricao: "");
  }
}
