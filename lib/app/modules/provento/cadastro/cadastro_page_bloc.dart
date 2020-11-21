import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:controle_financeiro/app/bloc/acao_bloc.dart';
import 'package:controle_financeiro/app/bloc/provento_bloc.dart';
import 'package:controle_financeiro/app/components/fields/autocomplete/suggestion_model.dart';
import 'package:controle_financeiro/app/model/acao_model.dart';
import 'package:controle_financeiro/app/model/provento_model.dart';
import 'package:flutter/material.dart';

import '../provento_module.dart';

class CadastroPageBloc extends BlocBase {
  final formKey = GlobalKey<FormState>();
  AcaoBloc acaoBloc = ProventoModule.to.getBloc<AcaoBloc>();
  ProventoBloc proventoBloc = ProventoModule.to.getBloc<ProventoBloc>();
  Suggestion acaoSuggestion = Suggestion();
  Provento provento = Provento(data: DateTime.now());

  findAcao(String texto) async {
    List<Acao> acoes = await acaoBloc.findAcaoByPapelContaining(texto);
    return acoes.map((acao) => Suggestion(id: acao.id, text: acao.papel));
  }

  changePapel(int idAcao, String papel) {
    acaoSuggestion.id = idAcao;
    acaoSuggestion.text = papel;
    provento.papel = papel;
  }

  void changeData(DateTime data) {
    provento.data = data;
  }

  changeValor(double valor) {
    provento.valor = valor;
  }

  submit() {
    proventoBloc.saveProvento(provento);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
