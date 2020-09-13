import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:controle_financeiro/app/bloc/acao_bloc.dart';
import 'package:controle_financeiro/app/bloc/transacao_bloc.dart';
import 'package:controle_financeiro/app/model/acao_model.dart';
import 'package:controle_financeiro/app/model/transacao_model.dart';
import 'package:controle_financeiro/app/modules/transacao/transacao_module.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class TransacaoPageBloc extends BlocBase {
  final formKey = GlobalKey<FormState>();
  BehaviorSubject<List<Transacao>> transacaoListBehaviorSubject =
      BehaviorSubject();
  AcaoBloc acaoBloc = TransacaoModule.to.getBloc<AcaoBloc>();
  TransacaoBloc transacaoBloc = TransacaoModule.to.getBloc<TransacaoBloc>();
  TipoTransacao tipoTransacao = TipoTransacao.COMPRA;
  Transacao transacao = Transacao(idUsuario: 1, data: DateTime.now());

  findAcao(String texto) async {
    List<Acao> acoes = await acaoBloc.findAcaoByPapelContaining(texto);
    return acoes.map((acao) => acao.papel);
  }

  Future<void> buscaTransacoes() async {
    transacaoListBehaviorSubject.add(await transacaoBloc.buscaTransacao());
  }

  changeData(DateTime data) {
    transacao.data = data;
  }

  changeQuantidade(int quantidade) {
    transacao.quantidade = quantidade;
  }

  changeValor(double valor) {
    transacao.valor = valor;
  }

  changePapel(String papel) {
    transacao.papel = papel;
  }

  changeTipoTransacao(Map<String, bool> mapTransacaoSelecionada) {
    mapTransacaoSelecionada.forEach((trasancao, isSelecionada) {
      if (isSelecionada) {
        tipoTransacao = transacaoBloc.tipoTransacaoStringToEnum(trasancao);
      }
    });
  }

  submit() async {
    if (tipoTransacao == TipoTransacao.COMPRA)
      await transacaoBloc.compra(transacao);
    else
      await transacaoBloc.venda(transacao);
    await buscaTransacoes();
  }

  @override
  void dispose() {
    transacaoListBehaviorSubject.close();
    super.dispose();
  }

  Future<void> delete(Transacao transacao) async {
    await transacaoBloc.delete(transacao);
  }
}
