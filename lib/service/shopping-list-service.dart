import 'package:http/http.dart' as http;

Future<String> getShoppingList() async {
  final response = await http
      .get('https://ar-controle-financeiro.herokuapp.com/shopping-list');
  print('shopping itens:' + response.body);
  return response.body;
}
