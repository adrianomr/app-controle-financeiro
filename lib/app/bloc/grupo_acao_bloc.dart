import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:controle_financeiro/app/model/grupo_acao.dart';
import 'package:controle_financeiro/app/service/grupo_acao_service.dart';
import 'package:dio/dio.dart';

class GrupoAcaoBloc extends BlocBase {
  GrupoAcaoService grupoAcaoService = GrupoAcaoService();

  Future<List<GrupoAcao>> findGrupoAcao() async {
    Response response = await grupoAcaoService.buscaGruposSomenteSubgrupos();
    List<GrupoAcao> grupoAcaoList = [];
    if (response.data != null) {
      response.data.forEach((rebalanceamento) {
        grupoAcaoList.add(GrupoAcao.fromJson(rebalanceamento));
      });
    }
    return grupoAcaoList;
  }

  Future<bool> delete(GrupoAcao grupoAcao) async {
    Response response = await grupoAcaoService.delete(grupoAcao.id);
    print(response.toString());
    return response.statusCode == 200;
  }

  Future<bool> save(GrupoAcao grupoAcao) async {
    grupoAcao.idUsuario = 1;
    Response response = await grupoAcaoService.post(grupoAcao);
    print(response.toString());
    return response.statusCode == 200;
  }
}
