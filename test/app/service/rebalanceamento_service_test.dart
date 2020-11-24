import 'package:controle_financeiro/app/model/rebalanceamento_model.dart';
import 'package:controle_financeiro/app/service/rebalanceamento_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  RebalanceamentoService rebalanceamentoService;

  setUp(() {
    rebalanceamentoService = RebalanceamentoService();
  });

  group('RebalanceamentoService Test', () {
    test("busca lista de rebalanceamento", () async {
      Response response = await rebalanceamentoService.getRebalanceamentoList();
      expect(response.statusCode, 200);
    });
    test("Cria rebalanceamento", () async {
      Response response = await rebalanceamentoService.create(
          Rebalanceamento(papel: "BCFF11", percentual: 10.5, idUsuario: 1));
      expect(response.statusCode, 200);
    });
    test("Altera rebalanceamento", () async {
      Response response = await rebalanceamentoService.alter(Rebalanceamento(
          id: 7069,
          papel: "BCFF11",
          percentual: 10.5,
          idUsuario: 1));
      expect(response.statusCode, 200);
    });
  });
}
