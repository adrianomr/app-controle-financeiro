import 'package:controle_financeiro/app/conf/controle_acoes_server_conf.dart';
import 'package:controle_financeiro/app/model/provento_model.dart';
import 'package:dio/dio.dart';

class ProventoService {
  Dio dio = Dio();
  String path = ControleAcoesServerConf.URL + "/provento";

  Future<Response> findProventoListByIdAcao(int idAcao) async {
    return await dio.get('$path', queryParameters: {"idAcao": idAcao});
  }

  Future<Response> save(Provento provento) async {
    return await dio.post(path, data: provento);
  }

  Future<Response> delete(int id) async {
    return await dio.delete('$path/$id');
  }
}
