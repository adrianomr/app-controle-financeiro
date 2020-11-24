import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:controle_financeiro/app/bloc/acao_bloc.dart';
import 'package:controle_financeiro/app/bloc/rebalanceamento_bloc.dart';
import 'package:controle_financeiro/app/model/acao_model.dart';
import 'package:controle_financeiro/app/model/rebalanceamento_model.dart';
import 'package:controle_financeiro/app/modules/rebalanceamento/rebalanceamento_module.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class RebalanceamentoPageBloc extends BlocBase {
  final formKey = GlobalKey<FormState>();
  AcaoBloc acaoBloc = RebalanceamentoModule.to.getBloc<AcaoBloc>();
  RebalanceamentoBloc rebalanceamentoBloc =
      RebalanceamentoModule.to.getBloc<RebalanceamentoBloc>();
  Rebalanceamento rebalanceamento = Rebalanceamento();
  BehaviorSubject<List<Rebalanceamento>> rebalanceamentoListBehaviorSubject =
      BehaviorSubject();
  bool digitarPercentual = false;

  @override
  void dispose() {
    rebalanceamentoListBehaviorSubject.close();
    super.dispose();
  }

  getRebalanceamentoList() async {
    rebalanceamentoListBehaviorSubject
        .add(await rebalanceamentoBloc.getListRebalanceamento());
  }

  findAcao(String texto) async {
    List<Acao> acoes = await acaoBloc.findAcaoByPapelContaining(texto);
    return acoes.map((acao) => acao.papel);
  }

  changePercentual(double percentual) {
    rebalanceamento.percentual = percentual;
  }

  changePapel(String papel) {
    rebalanceamento.papel = papel;
  }

  submit() async {
    if (!digitarPercentual)
      rebalanceamento.percentual = null;
    await rebalanceamentoBloc.criaRebalanceamento(rebalanceamento);
    await getRebalanceamentoList();
  }

  Future<void> delete(Rebalanceamento rebalanceamento) async {
    await rebalanceamentoBloc.delete(rebalanceamento);
    await getRebalanceamentoList();
  }

  changeNota(double nota) {
    rebalanceamento.nota = nota;
  }

  void changeDigitarPercentual(bool value) {
    digitarPercentual = value;
  }
}
