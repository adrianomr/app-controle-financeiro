import 'dart:developer';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:controle_financeiro/app/bloc/acao_bloc.dart';
import 'package:controle_financeiro/app/bloc/grupo_acao_bloc.dart';
import 'package:controle_financeiro/app/components/fields/autocomplete/suggestion_model.dart';
import 'package:controle_financeiro/app/model/acao_model.dart';
import 'package:controle_financeiro/app/model/grupo_acao.dart';
import 'package:controle_financeiro/app/modules/grupo_acao/grupo_acao_module.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class CadastroPageBloc extends BlocBase {
  final formKey = GlobalKey<FormState>();
  AcaoBloc acaoBloc = GrupoAcaoModule.to.getBloc<AcaoBloc>();
  GrupoAcaoBloc grupoAcaoBloc = GrupoAcaoModule.to.getBloc<GrupoAcaoBloc>();
  GrupoAcao grupoAcao = GrupoAcao();
  BehaviorSubject<GrupoAcao> grupoAcaoBehaviorSubject = BehaviorSubject();
  bool digitarPercentual = false;

  changeNota(double nota) {
    grupoAcao.nota = nota;
  }

  changeNome(String nome) {
    grupoAcao.nome = nome;
  }

  submit() {
    log(grupoAcao.toJson().toString());
    grupoAcaoBloc.save(grupoAcao);
    log("submit");
  }

  findAcao(String texto) async {
    List<Acao> acoes = await acaoBloc.findAcaoByPapelContaining(texto);
    return acoes.map((acao) => Suggestion(id: acao.id, text: acao.papel));
  }

  changePapel(int idAcao, String papel) {
    if (grupoAcao.acaoList == null) grupoAcao.acaoList = [];
    grupoAcao.acaoList.add(Acao(id: idAcao, papel: papel));
    grupoAcaoBehaviorSubject.add(grupoAcao);
  }

  @override
  void dispose() {
    grupoAcaoBehaviorSubject.close();
    super.dispose();
  }

  deleteAcao(Acao acao) {
    grupoAcao.acaoList.remove(acao);
    grupoAcaoBehaviorSubject.add(grupoAcao);
  }

  void changeDigitarPercentual(bool value) {
    digitarPercentual = value;
  }

  changePercentual(double percentual) {
    grupoAcao.percentual = percentual;
  }
}
