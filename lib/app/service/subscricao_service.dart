import 'package:controle_financeiro/app/conf/controle_acoes_server_conf.dart';
import 'package:controle_financeiro/app/model/subscricao_model.dart';
import 'package:dio/dio.dart';

class SubscricaoService {
  Dio dio = Dio();
  String path = ControleAcoesServerConf.URL + '/subscricao';

  Future<Response> post(Subscricao subscricao) async {
    return await dio.post(path, data: subscricao);
  }

  Future<Response> buscaTransacoes() async {
    return await dio.get(path, queryParameters: {'idUsuario': 1});
  }

  Future<void> delete(int id) async {
    await dio.delete('$path/$id');
  }
}
