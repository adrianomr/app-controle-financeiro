import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:controle_financeiro/app/model/corretora_model.dart';
import 'package:controle_financeiro/app/service/corretora_service.dart';
import 'package:dio/dio.dart';

class CorretoraBloc extends BlocBase {
  CorretoraService corretoraService = CorretoraService();

  Future<List<Corretora>> getCorretoraList() async {
    Response response = await corretoraService.getCorretoraList();
    List<dynamic> data = response.data;
    return data.map((corretora) => Corretora.fromJson(corretora)).toList();
  }
}
