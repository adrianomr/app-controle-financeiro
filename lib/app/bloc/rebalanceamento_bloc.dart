import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:controle_financeiro/app/model/carteira_model.dart';
import 'package:controle_financeiro/app/model/rebalanceamento_model.dart';
import 'package:controle_financeiro/app/model/usuario_model.dart';
import 'package:controle_financeiro/app/service/rebalanceamento_service.dart';
import 'package:dio/dio.dart';

class RebalanceamentoBloc extends BlocBase {
  RebalanceamentoService rebalanceamentoService = RebalanceamentoService();

  Future<List<Rebalanceamento>> getListRebalanceamento() async {
    List<Rebalanceamento> rebalanceamentoList = [];
    Response response = await rebalanceamentoService.getRebalanceamentoList();
    if (response.data != null) {
      response.data.forEach((rebalanceamento) {
        rebalanceamentoList.add(Rebalanceamento.fromJson(rebalanceamento));
      });
    }
    return rebalanceamentoList;
  }

  Future<Carteira> getCarteiraRebalanceamento() async {
    Response response =
        await rebalanceamentoService.getCarteiraRebalanceamento();
    return Carteira.fromJson(response.data);
  }

  Rebalanceamento addUsuario(Rebalanceamento rebalanceamento) {
    rebalanceamento.usuario = Usuario(id: 1, nome: "Adriano");
    return rebalanceamento;
  }

  Future<bool> criaRebalanceamento(Rebalanceamento rebalanceamento) async {
    rebalanceamento = addUsuario(rebalanceamento);
    Response response = await rebalanceamentoService.create(rebalanceamento);
    return response.statusCode == 200;
  }

  Future<bool> alteraRebalanceamento(Rebalanceamento rebalanceamento) async {
    rebalanceamento = addUsuario(rebalanceamento);
    Response response = await rebalanceamentoService.alter(rebalanceamento);
    return response.statusCode == 200;
  }
}
