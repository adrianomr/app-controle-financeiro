import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:controle_financeiro/app/model/transacao_model.dart';
import 'package:controle_financeiro/app/service/transacao_service.dart';
import 'package:dio/dio.dart';

class TransacaoBloc extends BlocBase {
  TransacaoService transacaoService = TransacaoService();

  Future<bool> compra(Transacao transacao) async {
    Response response = await transacaoService.compra(transacao);
    print(response.toString());
    return response.statusCode == 200;
  }

  Future<bool> venda(Transacao transacao) async {
    Response response = await transacaoService.venda(transacao);
    print(response.toString());
    return response.statusCode == 200;
  }

  TipoTransacao tipoTransacaoStringToEnum(String tipo) {
    Map<String, TipoTransacao> map = {
      "COMPRA": TipoTransacao.COMPRA,
      "VENDA": TipoTransacao.VENDA
    };
    return map[tipo.toUpperCase()];
  }

  Future<List<Transacao>> buscaTransacao() async {
    List<Transacao> rebalanceamentoList = [];
    Response response = await transacaoService.buscaTransacoes();
    if (response.data != null) {
      response.data.forEach((rebalanceamento) {
        rebalanceamentoList.add(Transacao.fromJson(rebalanceamento));
      });
    }
    return rebalanceamentoList;
  }

  Future<void> delete(Transacao transacao) async {
    await transacaoService.delete(transacao.id);
  }
}

enum TipoTransacao { COMPRA, VENDA }
