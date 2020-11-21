import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:controle_financeiro/app/bloc/acao_bloc.dart';
import 'package:controle_financeiro/app/bloc/provento_bloc.dart';
import 'package:controle_financeiro/app/components/fields/autocomplete/suggestion_model.dart';
import 'package:controle_financeiro/app/model/acao_model.dart';
import 'package:controle_financeiro/app/model/provento_model.dart';
import 'package:controle_financeiro/app/modules/provento/provento_module.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ProventoPageBloc extends BlocBase {
  BehaviorSubject<List<Provento>> proventoListBehaviorSubject =
      BehaviorSubject();
  AcaoBloc acaoBloc = ProventoModule.to.getBloc<AcaoBloc>();
  ProventoBloc proventoBloc = ProventoModule.to.getBloc<ProventoBloc>();
  Suggestion acaoSuggestion = Suggestion();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    proventoListBehaviorSubject.close();
    super.dispose();
  }

  Future<void> buscaProventos() async {
    if (acaoSuggestion != null && acaoSuggestion.id != null)
      proventoListBehaviorSubject
          .add(await proventoBloc.findProventosByIdAcao(acaoSuggestion.id));
  }

  submit() {}

  delete(Provento provento) async {
    await proventoBloc.delete(provento);
    buscaProventos();
  }

  findAcao(String texto) async {
    List<Acao> acoes = await acaoBloc.findAcaoByPapelContaining(texto);
    return acoes.map((acao) => Suggestion(id: acao.id, text: acao.papel));
  }

  changePapel(int idAcao, String papel) {
    acaoSuggestion.id = idAcao;
    acaoSuggestion.text = papel;
    buscaProventos();
  }
}
