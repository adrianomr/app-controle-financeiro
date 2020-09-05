import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:controle_financeiro/app/model/acao_model.dart';
import 'package:controle_financeiro/app/service/acao_service.dart';
import 'package:dio/dio.dart';

class AcaoBloc extends BlocBase {
  AcaoService acaoService = AcaoService();

  Future<List<Acao>> findAcaoByPapelContaining(String papel) async {
    Response response = await acaoService.findAcaoByPapel(papel);
    List<dynamic> content = response.data["content"];
    List<Acao> acoes = content.map((json) => Acao.fromJson(json)).toList();
    print(response.toString());
    return acoes;
  }
}
