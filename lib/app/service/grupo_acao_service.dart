import 'package:controle_financeiro/app/conf/controle_acoes_server_conf.dart';
import 'package:controle_financeiro/app/model/grupo_acao.dart';
import 'package:dio/dio.dart';

class GrupoAcaoService {
  Dio dio = Dio();
  String path = ControleAcoesServerConf.URL + '/grupo-acao';

  Future<Response> post(GrupoAcao grupoAcao) async {
    return await dio.post(path, data: grupoAcao);
  }

  Future<Response> buscaGruposSomenteSubgrupos() async {
    return await dio
        .get(path, queryParameters: {'idUsuario': 1, 'onlySubgroups': true});
  }

  Future<Response> delete(int id) async {
    return await dio.delete('$path/$id');
  }
}
