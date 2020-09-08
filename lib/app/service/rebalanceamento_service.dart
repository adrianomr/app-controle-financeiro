import 'package:controle_financeiro/app/conf/controle_acoes_server_conf.dart';
import 'package:controle_financeiro/app/model/rebalanceamento_model.dart';
import 'package:dio/dio.dart';

class RebalanceamentoService {
  Dio dio = Dio();
  String path = ControleAcoesServerConf.URL;

  Future<Response> getRebalanceamentoList() async {
    return await dio.get('$path/rebalanceamento?usuario=1');
  }

  Future<Response> create(Rebalanceamento rebalanceamento) async {
    return await dio.post('$path/rebalanceamento', data: rebalanceamento);
  }

  Future<Response> alter(Rebalanceamento rebalanceamento) async {
    return await dio.put('$path/rebalanceamento', data: rebalanceamento);
  }
}
