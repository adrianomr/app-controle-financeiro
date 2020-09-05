import 'package:controle_financeiro/app/model/transacao_model.dart';
import 'package:controle_financeiro/app/service/acao_service.dart';
import 'package:controle_financeiro/app/service/transacao_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TransacaoService transacaoService;

  setUp(() {
    transacaoService = TransacaoService();
  });

  group('AcaoService Test', () {
    test("Compra acao", () async {
      Response response = await transacaoService.compra(Transacao(
          idUsuario: 1,
          papel: "BCFF11",
          data: DateTime.now(),
          quantidade: 1,
          valor: 90.5));
      expect(response.statusCode, 200);
    });
    test("Vende acao", () async {
      Response response = await transacaoService.venda(Transacao(
          idUsuario: 1,
          papel: "BCFF11",
          data: DateTime.now(),
          quantidade: 1,
          valor: 90.5));
      expect(response.statusCode, 200);
    });
  });
}
