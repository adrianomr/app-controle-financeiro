import 'package:controle_financeiro/app/conf/controle_acoes_server_conf.dart';
import 'package:dio/dio.dart';

class AcaoService {
  Dio dio = Dio();
  String path = ControleAcoesServerConf.URL;

  Future<Response> findAcaoByPapel(String papel) async {
    return await dio
        .get('$path/acao', queryParameters: {"papel": papel.toUpperCase()});
  }
}
