import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:controle_financeiro/app/model/provento_model.dart';
import 'package:controle_financeiro/app/service/provento_service.dart';
import 'package:dio/dio.dart';

class ProventoBloc extends BlocBase {
  ProventoService proventoService = ProventoService();

  Future<List<Provento>> findProventosByIdAcao(int idAcao) async {
    Response response = await proventoService.findProventoListByIdAcao(idAcao);
    List<dynamic> content = response.data;
    List<Provento> proventoList =
        content.map((json) => Provento.fromJson(json)).toList();
    print(response.toString());
    return proventoList;
  }

  Future<bool> saveProvento(Provento provento) async {
    Response response = await proventoService.save(provento);
    print(response.toString());
    return response.statusCode == 200;
  }
}
