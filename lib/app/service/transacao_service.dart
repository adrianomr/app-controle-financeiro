import 'package:controle_financeiro/app/conf/controle_acoes_server_conf.dart';
import 'package:controle_financeiro/app/model/transacao_model.dart';
import 'package:dio/dio.dart';

class TransacaoService {
  Dio dio = Dio();
  String path = ControleAcoesServerConf.URL;

  Future<Response> venda(Transacao transacao) async {
    return await dio.post('$path/transacao/venda', data: transacao);
  }

  Future<Response> compra(Transacao transacao) async {
    return await dio.post('$path/transacao/compra', data: transacao);
  }

  Future<Response> buscaTransacoes() async {
    return await dio.get('$path/transacao');
  }

  Future<void> delete(int id) async {
    await dio.delete('$path/transacao/$id');
  }
}
