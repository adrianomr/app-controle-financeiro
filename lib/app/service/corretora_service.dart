import 'package:controle_financeiro/app/conf/controle_acoes_server_conf.dart';
import 'package:dio/dio.dart';

class CorretoraService {
  Dio dio = Dio();
  String path = ControleAcoesServerConf.URL + "/corretora";

  Future<Response> getCorretoraList() async {
    return await dio.get(path);
  }
}
