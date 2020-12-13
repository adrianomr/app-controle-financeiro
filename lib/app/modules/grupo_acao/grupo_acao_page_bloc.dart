import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:controle_financeiro/app/bloc/acao_bloc.dart';
import 'package:controle_financeiro/app/bloc/grupo_acao_bloc.dart';
import 'package:controle_financeiro/app/components/fields/autocomplete/suggestion_model.dart';
import 'package:controle_financeiro/app/model/acao_model.dart';
import 'package:controle_financeiro/app/model/grupo_acao.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'grupo_acao_module.dart';

class GrupoAcaoPageBloc extends BlocBase {
  BehaviorSubject<List<GrupoAcao>> grupoAcaoListBehaviorSubject =
      BehaviorSubject();
  AcaoBloc acaoBloc = GrupoAcaoModule.to.getBloc<AcaoBloc>();
  GrupoAcaoBloc grupoAcaoBloc = GrupoAcaoModule.to.getBloc<GrupoAcaoBloc>();
  Suggestion acaoSuggestion = Suggestion();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    grupoAcaoListBehaviorSubject.close();
    super.dispose();
  }

  Future<void> buscaGrupoAcaos() async {
    grupoAcaoListBehaviorSubject.add(await grupoAcaoBloc.findGrupoAcao());
  }

  submit() {}

  delete(GrupoAcao grupoAcao) async {
    await grupoAcaoBloc.delete(grupoAcao);
    buscaGrupoAcaos();
  }

  findAcao(String texto) async {
    List<Acao> acoes = await acaoBloc.findAcaoByPapelContaining(texto);
    return acoes.map((acao) => Suggestion(id: acao.id, text: acao.papel));
  }

  changePapel(int idAcao, String papel) {
    acaoSuggestion.id = idAcao;
    acaoSuggestion.text = papel;
    buscaGrupoAcaos();
  }
}
