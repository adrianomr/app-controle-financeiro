import 'package:controle_financeiro/app/service/acao_service.dart';
import 'package:controle_financeiro/app/service/carteira_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  CarteiraService carteiraService;

   setUp(() {
     carteiraService = CarteiraService();
   });

   group('CarteiraService Test', () {
     test("Busca carteira usuario test", () async {
       Response response = await carteiraService.getCarteira();
       expect(response.statusCode, 200);
     });
   });
}
