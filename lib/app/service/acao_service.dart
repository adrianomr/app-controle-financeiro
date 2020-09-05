import 'package:dio/dio.dart';

class AcaoService {
  Dio dio = Dio();
  String path = "http://192.168.100.55:8080";

  Future<Response> findAcaoByPapel(String papel) async {
    return await dio.get('$path/acao', queryParameters: {"papel": papel});
  }
}