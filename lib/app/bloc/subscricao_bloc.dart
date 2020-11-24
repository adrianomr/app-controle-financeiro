import 'dart:io';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:controle_financeiro/app/model/subscricao_model.dart';
import 'package:controle_financeiro/app/service/subscricao_service.dart';
import 'package:dio/dio.dart';

class SubscricaoBloc extends BlocBase {
  SubscricaoService subscricaoService = SubscricaoService();

  Future<bool> save(Subscricao subscricao) async {
    subscricao.idUsuario = 1;
    Response response = await subscricaoService.post(subscricao);
    return response.statusCode == HttpStatus.ok;
  }

  Future<List<Subscricao>> buscaSubscricao() async {
    List<Subscricao> rebalanceamentoList = [];
    Response response = await subscricaoService.buscaTransacoes();
    if (response.data != null) {
      response.data.forEach((rebalanceamento) {
        rebalanceamentoList.add(Subscricao.fromJson(rebalanceamento));
      });
    }
    return rebalanceamentoList;
  }

  Future<void> delete(Subscricao subscricao) async {
    await subscricaoService.delete(subscricao.id);
  }
}
