import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:controle_financeiro/app/bloc/acao_bloc.dart';
import 'package:controle_financeiro/app/bloc/corretora_bloc.dart';
import 'package:controle_financeiro/app/bloc/subscricao_bloc.dart';
import 'package:controle_financeiro/app/components/fields/autocomplete/suggestion_model.dart';
import 'package:controle_financeiro/app/model/acao_model.dart';
import 'package:controle_financeiro/app/model/corretora_model.dart';
import 'package:controle_financeiro/app/model/subscricao_model.dart';
import 'package:controle_financeiro/app/modules/subscricao/subscricao_module.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class SubscricaoPageBloc extends BlocBase {
  final formKey = GlobalKey<FormState>();
  BehaviorSubject<List<Subscricao>> subscricaoListBehaviorSubject =
      BehaviorSubject();
  AcaoBloc acaoBloc = SubscricaoModule.to.getBloc<AcaoBloc>();
  SubscricaoBloc subscricaoBloc = SubscricaoModule.to.getBloc<SubscricaoBloc>();
  CorretoraBloc corretoraBloc = SubscricaoModule.to.getBloc<CorretoraBloc>();
  Subscricao subscricao = Subscricao(idUsuario: 1, data: DateTime.now());

  findAcao(String texto) async {
    List<Acao> acoes = await acaoBloc.findAcaoByPapelContaining(texto);
    return acoes.map((acao) => acao.papel);
  }

  Future<void> buscaTransacoes() async {
    List<Subscricao> subscricaoList = await subscricaoBloc.buscaSubscricao();
    subscricaoList.sort((subscricaoA, subscricaoB) =>
        subscricaoB.data.compareTo(subscricaoA.data));
    subscricaoListBehaviorSubject.add(subscricaoList);
  }

  changeData(DateTime data) {
    subscricao.data = data;
  }

  changeQuantidade(int quantidade) {
    subscricao.quantidade = quantidade;
  }

  changeValor(double valor) {
    subscricao.valor = valor;
  }

  changePapel(String papel) {
    subscricao.papel = papel;
  }

  submit() async {
    await subscricaoBloc.save(subscricao);
    await buscaTransacoes();
  }

  @override
  void dispose() {
    subscricaoListBehaviorSubject.close();
    super.dispose();
  }

  Future<void> delete(Subscricao subscricao) async {
    await subscricaoBloc.delete(subscricao);
  }

  findCorretora(String text) async {
    List<Corretora> corretoraList = await corretoraBloc.getCorretoraList();
    corretoraList.where((corretora) => corretora.nome == text);
    return corretoraList.map((e) => Suggestion(id: e.id, text: e.nome));
  }

  changeCorretora(int id, String corretora) {
    subscricao.idCorretora = id;
  }
}
