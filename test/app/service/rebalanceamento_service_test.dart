import 'package:controle_financeiro/app/model/acao_model.dart';
import 'package:controle_financeiro/app/model/rebalanceamento_model.dart';
import 'package:controle_financeiro/app/model/usuario_model.dart';
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
      Response response = await rebalanceamentoService.create(Rebalanceamento(
          acao: Acao(id: 1),
          percentual: 10.5,
          usuario: Usuario(id: 1, nome: "Adriano")));
      expect(response.statusCode, 200);
    });
    test("Altera rebalanceamento", () async {
      Response response = await rebalanceamentoService.alter(Rebalanceamento(
          id: 7069,
          acao: Acao(id: 1),
          percentual: 10.5,
          usuario: Usuario(id: 1, nome: "Adriano")));
      expect(response.statusCode, 200);
    });
  });
}
