import 'package:controle_financeiro/app/conf/controle_acoes_server_conf.dart';
import 'package:dio/dio.dart';

class CarteiraService {
  Dio dio = Dio();
  String path = ControleAcoesServerConf.URL;

  Future<Response> getCarteira() async {
    return await dio.get('$path/usuario/1/carteira');
  }
}
