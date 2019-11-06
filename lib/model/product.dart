import 'package:controle_financeiro/model/base/product-base.dart';

class Product extends ProductBase {
  Product({
    int id,
    String descricao,
    int valor,
  }) : super(id: id, descricao: descricao, valor: valor);
}
