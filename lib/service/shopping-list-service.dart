import 'package:http/http.dart' as http;
import 'package:controle_financeiro/model/product.dart';
import 'package:flutter/services.dart';

Future<String> getPost() async {
  final response = await http
      .get('https://ar-controle-financeiro.herokuapp.com/shopping-item');
  print('shopping itens:' + response.body);
  return response.body;
}
