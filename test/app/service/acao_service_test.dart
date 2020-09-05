import 'package:controle_financeiro/app/service/acao_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  AcaoService acaoService;

   setUp(() {
     acaoService = AcaoService();
   });

   group('AcaoService Test', () {
     test("Busca acao test", () async {
       Response response = await acaoService.findAcaoByPapel("BCFF");
       expect(response.statusCode, 200);
     });
   });
}
