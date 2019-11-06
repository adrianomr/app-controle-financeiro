import 'package:controle_financeiro/model/base/product-base.dart';

class Product extends ProductBase {
  Product({
    int id,
    String descricao,
    double valor,
  }) : super(id: id, descricao: descricao, valor: valor);

  Product.fromBase(ProductBase base)
      : super(id: base.id, descricao: base.descricao, valor: base.valor);

  static Product fromJson(Map<String, dynamic> json) {
    ProductBase base = ProductBase.fromJson(json);
    return Product.fromBase(base);
  }

}
